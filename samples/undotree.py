"""
This module contains the classes ActionTree and Node, to store
the command history.
"""
from . import commands
from .document import Document, next_document, previous_document
from .filecommands import quit_document, quit_all, open_file, force_quit
from .mode import Mode
from logging import debug


class UndoTree:

    """
    Stores the command history as a tree with undo/redo functionality.
    """
    sequence = None
    sequence_depth = 0

    def __init__(self, doc):
        self.doc = doc
        self.root = Node(None)
        self.current_node = self.root

    def undo(self):
        """Undo previous command set current_node to its parent."""
        if self.sequence != None:
            # TODO: does this have to be a hard fail?
            raise Exception('Cannot perform undo; a sequence of commands is being added')

        if self.current_node.parent:
            for command in reversed(self.current_node.commands):
                command.undo(self.doc)
            self.current_node = self.current_node.parent

    def redo(self, child_index=0):
        """Redo most recent next command, or command at child_index if specified."""
        if self.sequence != None:
            # TODO: does this have to be a hard fail?
            raise Exception('Cannot perform redo; a sequence of commands is being added')

        if self.current_node and self.current_node.children:
            l = len(self.current_node.children)
            assert 0 <= child_index < l

            self.current_node = self.current_node.children[child_index]
            for command in self.current_node.commands:
                command.do(self.doc)

    def add(self, command):
        """Add a new undoable command."""
        if self.sequence != None:
            self.sequence.add_command(command)
        else:
            node = Node(self.current_node)
            node.add_command(command)
            self.current_node.add_child(node)
            self.current_node = node

    def hard_undo(self):
        """
        Actually removes current_node.
        Useful for previewing operations.
        """
        if self.sequence != None:
            # TODO: does this have to be a hard fail?
            raise Exception(
                'Cannot perform hard undo; a sequence of commands is being added'
            )

        if self.current_node.parent:
            current_node = self.current_node
            self.undo()
            self.current_node.children.remove(current_node)

    def start_sequence(self):
        """
        Indicate start of a sequence.
        All incoming commands should be gathered and put into one compound command.
        """
        if self.sequence_depth == 0:
            self.sequence = Node(self.current_node)
        self.sequence_depth += 1
        debug('Starting undo sequence. Entering depth: {}'.format(self.sequence_depth))

    def end_sequence(self):
        """
        End of sequence.
        """
        if self.sequence_depth < 1:
            raise Exception('Cannot end sequence; no sequence present.')

        debug('Ending undo sequence. Leaving depth: {}'.format(self.sequence_depth))

        if self.sequence_depth == 1:
            if self.sequence.commands != []:
                self.current_node.add_child(self.sequence)
                self.current_node = self.sequence
            self.sequence_depth = 0
            self.sequence = None
        else:
            self.sequence_depth -= 1


class Node:

    """
    Node of an ActionTree.
    Each node can have a single parent, a list of commands and a list of children.
    """

    def __init__(self, parent):
        self.parent = parent
        self.commands = []
        self.children = []

    def add_command(self, command):
        """Add an command to node."""
        self.commands.append(command)

    def add_child(self, node):
        """Add a child to node. First child is most recent."""
        self.children.insert(0, node)


def init(doc):
    doc.undotree = UndoTree(doc)
Document.OnDocumentInit.add(init)



# Some commands for interacting with the undo tree
def undo(doc):
    """Undo last command."""
    doc.undotree.undo()
commands.undo = undo


def redo(doc):
    """Redo last undo."""
    doc.undotree.redo()
commands.redo = redo

class UndoMode(Mode):

    """
    Walk around in undo tree using arrow keys.
    You can only switch branches between siblings.
    """

    def __init__(self, doc):
        Mode.__init__(self, doc)
        self.keymap.update({
            'left': self.left,
            'right': self.right,
            'up': self.up,
            'down': self.down,
        })
        self.allowedcommands.extend([
            next_document, previous_document, quit_document,
            quit_all, open_file, force_quit
        ])

    def start(self, doc, *args, **kwargs):
        debug('Starting undo mode')
        # Make sure the child_index is set to the index we now have
        self.child_index = self.current_index()
        Mode.start(self, doc, *args, **kwargs)

    def stop(self, doc, *args, **kwargs):
        debug('Exiting undo mode')
        Mode.stop(self, doc)

    def left(self, doc):
        # We can always just call undo; if there is no parent it will do nothing
        self.child_index = 0
        doc.undotree.undo()

    def right(self, doc):
        # We can always just call redo; if there is no child it will do nothing
        self.child_index = 0
        doc.undotree.redo()

    def up(self, doc):
        self.child_index -= 1
        # update_child_index() will take care of having a valid child_index
        self.update_child_index()

    def down(self, doc):
        self.child_index += 1
        # update_child_index() will take care of having a valid child_index
        self.update_child_index()

    def update_child_index(self):
        """Undo and execute the child pointed by the current child_index."""
        if self.doc.undotree.current_node.parent != None:
            self.doc.undotree.undo()

            # The child index must be bound to the correct domain
            self.child_index = self.bound(self.child_index)

            self.doc.undotree.redo(self.child_index)

    def bound(self, child_index):
        """Bound the given child_index to be a valid index."""
        l = len(self.doc.undotree.current_node.children)
        if l > 0:
            child_index = min(child_index, l - 1)
            child_index = max(child_index, 0)
            assert 0 <= child_index < l
        return child_index

    def current_index(self):
        node = self.doc.undotree.current_node
        return node.parent.children.index(node) if node.parent != None else 0

def init_undomode(doc):
    doc.modes.undomode = UndoMode(doc)
Document.OnModeInit.add(init_undomode)


def undomode(doc):
    return doc.modes.undomode
commands.undomode = undomode
