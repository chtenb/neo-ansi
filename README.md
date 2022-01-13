# Ansi 16 syntax highlighting standard

*Disclaimer: the guidelines are still in development and are subject to change.*

## Design principles for a syntax highlighting scheme standard

### A) It needs to look good.

1. The colors need to be *well-balanced* for the *majority* of the languages.
2. It is very annoying if one language looks good but another doesn't.

### B). It needs to make the code more readable.
1. The accents and colors need to make sort of sense semantically.
2. The coloring needs to be consistent across languages that are similar. C# and Java code should be colored mostly the same.
3. The coloring needs to be consistent across themes. Language constructs that are colored equally in one theme should be colored equally in another.
4. The coloring needs to be consistent across tooling.

### C). It needs to convenient to use across tooling, programming languages and color schemes.
1. It should be possible to use the scheme in a terminal. 
   Since generally only the 8 ANSI colors and their bright alternatives are themable in most terminal emulators, the scheme needs to restrict itself to 16 colors.
2. It needs to be easy to remap the colors but keep the same highlighting logic. 
   Currently, for many code editors (like VSCode) the quality of the highlighting logic varies wildly across themes and programming languages.
   We would like this to be constant, while allowing color schemes to vary.
   In other words, we'd like to define the highlighting logic once and reuse it for each new color scheme to promote maximum consistency and proper support across different programming languages.

## Proposal for highlevel guidelines for language construct assignment to ANSI colors

To make our life easier we will just concern ourselves with foreground colors.
Color themes that implement this scheme are assignments of colors to ANSI color numbers.
This is a global loose guideline, but language specific support can overrule this if it makes the scheme comply better with design requirements 1 and 2.
The guideline is based on common patterns seen in popular syntax highlighting themes.

Language construction assignment should make sure that the first 8 colors are assigned fairly balanced among each other and assigned more frequently on average than the last 8 colors.
This way colorscheme designers can make sure that the first 8 colors form a nicely balanced palet and be assured that the resulting colorscheme will balanced consistently across languages.

**For programming languages**

| Color Number | Name | Description |
| ------------ | ---- | ----------- |
| 0 | black | Low emphasis, comments
| 1 | red | Emphasis
| 2 | green | Strings
| 3 | yellow | Types
| 4 | blue | Operators, Functions
| 5 | magenta | Keywords
| 6 | cyan | Emphasis, Support
| 7 | white | Regular text
| 8 | bright black | Low emphasis
| 9 | bright red | Constants
| a | bright green | Miscellaneous
| b | bright yellow | Alternative Types
| c | bright blue | Operators, Functions with emphasis
| d | bright magenta | Keywords
| e | bright cyan | Punctuation
| f | bright white | Variables

For non-typed languages the `Type` category can be interpreted more broadly as types of language constructions.

**For markup languages**

To be done.

<!-- | Color Number | Name | Description |
| ------------ | ---- | ----------- |
| 0 | black | Low emphasis
| 1 | red | Emphasis, bold, tags
| 2 | green | Headers, Strings
| 3 | yellow | Headers
| 4 | blue | Miscellaneous
| 5 | magenta | Inline code
| 6 | cyan | Quotes
| 7 | white | Regular text
| 8 | bright black | Low emphasis, comments
| 9 | bright red | Numbers, data
| a | bright green | Links
| b | bright yellow | Headers with emphasis, attributes
| c | bright blue | Miscellaneous
| d | bright magenta | Miscellaneous
| e | bright cyan | Punctuation
| f | bright white | Emphasis, italic -->

A bright variant generally has more accent than its regular counterpart, but this is not required.
Moreover, in a light color theme the color with more accent would often actually be darker.

A color theme can in principle assign arbitrary colors to each ANSI color number.
E.g. ANSI color number 6 does not necessarily have to be (close to) cyan.
However, not all assignments will result in syntax highlighting schemes that promote readibility and consistency as stated in the design principles.
Moreover, if the assignment is more or less compatible with the ANSI colors, it means that the the resulting syntax highlighting scheme will be more compatible with other schemes and is more suitable as a drop-in replacement for a terminal theme.
But all this is subject to the discretion of the color scheme designer.

## Implementation for TextMate scopes

This repository implements a simple TextMate theme generator based on a palette of colors using a fixed scope assignment strategy.
The scope assignment template collection can be found in [templates/](https://github.com/chtenb/ansi16/tree/main/templates).
We generate an example set of themes from the palettes defined in [palettes/](https://github.com/chtenb/ansi16/tree/main/palettes).
The resulting themes are in [output/](https://github.com/chtenb/ansi16/tree/main/output).

### Usage in VSCode

See [VSCode Ansi 16](https://github.com/chtenb/vscode-ansi16).

### Usage in Terminal tools

The file [ansi16.thTheme](https://github.com/chtenb/ansi16/blob/main/output/ansi16.tmTheme) contains a definition of the ansi16 highlighting logic in terms of the 16 ANSI terminal colors.
Any terminal application that can read tmThemes can make use of this, like [bat](https://github.com/sharkdp/bat) and by extension [delta](https://github.com/dandavison/delta).
If the terminal colors are setup to match the colorscheme in your editor, the syntax highlighting in your terminal git diffs will look the same as in your text editor.
Note that the themes provided in the [VSCode Ansi 16](https://github.com/chtenb/vscode-ansi16) will automatically do this for you.
