# ansi16

## Design principles for a syntax highlighting scheme

### Level 1

1. It needs to look good.
2. It needs to make the code more readable.
3. It needs to convenient to use across tooling and programming languages.

### Level 2

1. a. The colors need to be *well-balanced* for the *majority* of the languages.
   b. It is very annoying if one language looks good but another doesn't.
2. a. The accents and colors need to make sort of sense semantically.
   b. The coloring needs to be consistent across languages that are similar. C# and Java code should be colored mostly the same.
   c. The coloring needs to be consistent across themes. Language constructs that are colored equally in one theme should be colored equally in another.
   d. The coloring needs to be consistent across tooling.
3. a. It should be possible to use the scheme in a terminal. 
   Since generally only the 8 ANSI colors and their bright alternatives are themable in most terminal emulators, the scheme needs to restrict itself to 16 colors.

## Proposal for guidelines for language construct assignment to ANSI colors

This is a global loose guideline, but language specific support can overrule this if it makes the scheme comply better with design requirements 1 and 2.
Color themes that implement this scheme are assignments of colors to ANSI color numbers.

| Color Number | Name | Description |
| ------------ | ---- | ----------- |
| 0 | black | Low emphasis
| 1 | red | Emphasis
| 2 | green | Types
| 3 | yellow | Types
| 4 | blue | Operators, functions
| 5 | magenta | Keywords
| 6 | cyan | Emphasis
| 7 | white | Regular text
| 8 | bright black | Low emphasis, comments
| 9 | bright red | Constants
| a | bright green | Strings
| b | bright yellow | Types with emphasis
| c | bright blue | Operators, functions with emphasis
| d | bright magenta | Keywords
| e | bright cyan | Punctuation
| f | bright white | Variables

A bright variant generally has more accent than its regular counterpart.
This means that the in a light color theme the bright variant would often actually be darker.

A color theme can in principle assign arbitrary colors to each ANSI color number.
E.g. ANSI color number 6 does not actually have to be cyan.
However, not all assignments will result in syntax highlighting schemes that promote readibility and consistency as stated in the design principles.
Moreover, if the assignment is more or less compatible with the ANSI colors, it means that the the resulting syntax highlighting scheme will be more compatible with other schemes and is more suitable as a drop-in replacement for a terminal theme.

## Implementation for TextMate scopes
