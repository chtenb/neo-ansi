# ANSI 16 syntax highlighting standard

## Design principles for a syntax highlighting scheme standard

### It needs to look good.

1. The colors need to be *well-balanced* for the *majority* of the languages.
2. It is very annoying if one language looks good but another doesn't.

### It needs to make the code more readable.
1. The accents and colors need to make sort of sense semantically.
2. The coloring needs to be consistent across languages that are similar. C# and Java code should be colored mostly the same.
3. The coloring needs to be consistent across themes. Language constructs that are colored equally in one theme should be colored equally in another.
4. The coloring needs to be consistent across tooling.

### It needs to convenient to use across tooling, programming languages and color schemes.
1. It should be possible to use the scheme in a terminal. 
   Since generally only the 8 ANSI colors and their bright alternatives are themable in most terminal emulators, the scheme needs to restrict itself to 16 colors.
2. It needs to be easy to remap the colors but keep the same highlighting logic. 
   Currently the quality of the highlighting logic varies wildly from theme to theme across programming languages.
   This is not what we want.
   We'd like to define the highlighting logic once and reuse it to promote maximum consistency and proper support across different programming languages.

## Proposal for guidelines for language construct assignment to ANSI colors

To make our life easier we will just concern ourselves with foreground colors.
Color themes that implement this scheme are assignments of colors to ANSI color numbers.
This is a global loose guideline, but language specific support can overrule this if it makes the scheme comply better with design requirements 1 and 2.
The guideline is based on common patterns seen in popular syntax highlighting themes.

For programming languages

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

For markup languages

| Color Number | Name | Description |
| ------------ | ---- | ----------- |
| 0 | black | Low emphasis
| 1 | red | Emphasis
| 2 | green | Header
| 3 | yellow | Header
| 4 | blue | Links
| 5 | magenta | Embedding
| 6 | cyan | Emphasis
| 7 | white | Regular text
| 8 | bright black | Low emphasis, comments
| 9 | bright red | Numbers, data
| a | bright green | Strings
| b | bright yellow | Headers with emphasis
| c | bright blue | Misc
| d | bright magenta | Misc
| e | bright cyan | Punctuation
| f | bright white | Misc

A bright variant generally has more accent than its regular counterpart.
This means that the in a light color theme the bright variant would often actually be darker.

A color theme can in principle assign arbitrary colors to each ANSI color number.
E.g. ANSI color number 6 does not actually have to be cyan.
However, not all assignments will result in syntax highlighting schemes that promote readibility and consistency as stated in the design principles.
Moreover, if the assignment is more or less compatible with the ANSI colors, it means that the the resulting syntax highlighting scheme will be more compatible with other schemes and is more suitable as a drop-in replacement for a terminal theme.

## Implementation for TextMate scopes
