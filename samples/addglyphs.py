import array
import fontTools.ttLib.ttFont as tt
import fontTools.ttLib.tables._g_l_y_f as glyf
import argparse
from pprint import pprint as p

parser = argparse.ArgumentParser(
    description='Add a turned two (U218A) and a turned three (U218B) glyph to the given TrueType font.')
parser.add_argument('inputfile', help='file name of the input font')
parser.add_argument('outputfile', help='file name of the output font')
parser.add_argument('--ttx', help='also dump a ttx file of the result', dest='ttx', action='store_true')
parser.add_argument('--no-ttx', dest='ttx', action='store_false')
parser.set_defaults(ttx=False)


args = parser.parse_args()

class TestClass(int):
    pass

def rotate_glyph(glyph):
    coords = [d for d in glyph.coordinates._a]
    xcoords = coords[0:len(coords):2]
    ycoords = coords[1:len(coords):2]
    new_ycoords = [-d + max(ycoords) + min(ycoords) for d in ycoords]
    new_xcoords = [-d + max(xcoords) + min(xcoords) for d in xcoords]
    new_coords = [val for pair in zip(
        new_xcoords, new_ycoords) for val in pair]
    glyph.coordinates._a = array.array('d', new_coords)


def add_turned_glyph(gs, gvarTable, glyfTable, name):
    turnedname = f'turned{name}'
    gs._hmtx[turnedname] = gs._hmtx[name]
    if gvarTable:
        gvarTable.variations[turnedname] = gvarTable.variations[name]

    orig_glyph = gs[name]._glyph

    turned_glyph = glyf.Glyph()
    turned_glyph.coordinates = glyf.GlyphCoordinates(orig_glyph.coordinates)
    turned_glyph.program = glyf.ttProgram.Program()
    turned_glyph.flags = orig_glyph.flags
    turned_glyph.endPtsOfContours = orig_glyph.endPtsOfContours
    turned_glyph.numberOfContours = orig_glyph.numberOfContours
    rotate_glyph(turned_glyph)
    glyfTable[turnedname] = turned_glyph


font = tt.TTFont(args.inputfile)

cmap = font.getBestCmap()
gs = font.getGlyphSet()

try:
    gvarTable = font['gvar']
except KeyError:
    gvarTable = None
glyfTable = font['glyf']

add_turned_glyph(gs, gvarTable, glyfTable, 'two')
add_turned_glyph(gs, gvarTable, glyfTable, 'three')
cmap[ord('\u218a')] = 'turnedtwo'
cmap[ord('\u218b')] = 'turnedthree'

font.save(args.outputfile)
if args.ttx:
    font.saveXML(f'{args.outputfile}.ttx')
