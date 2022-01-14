# Ansi 16 Syntax Highlighting Standard

*Disclaimer: the guidelines are still in development and are subject to change.*

This standard came into being because I was dissatisfied with the current state of syntax highlighting in my VSCode environment.

- The syntax highlighting quality and logic varies too much between themes.
- VSCode themes often look good on one language, but not on another.
- My git diffs in the terminal don't have the same syntax highlighting logic and colors as my editor.

In my opinion this state could be improved greatly by formulating a standard, akin to [base16](http://www.chriskempson.com/projects/base16/) but with a different set of use cases and trade offs in mind.
We will just concern ourselves with foreground colors in the context of syntax highlighting.

## Design principles for a syntax highlighting scheme standard

### A) It needs help color themes to look good.

1. The colors need to be *well-balanced* for the majority of the languages.

### B). It needs to help making the code more readable.

1. The coloring needs to be consistent across languages that are similar. C# and Java code should be colored mostly the same.
2. The coloring needs to be consistent across color themes. Language constructs that are colored equally in one color theme should be colored equally in another.
3. The coloring needs to be consistent across tooling.
4. The accents and colors need to make sort of sense semantically.

### C). It needs to convenient to use across tooling, programming languages and color themes.

1. It should be easy to use the highlighting scheme in a terminal. 
2. It needs to be easy to remap the colors but keep the same (high quality) highlighting logic. 
3. It needs to be easy to synchronize the syntax highlighting scheme between an editor and a terminal emulator.

## Proposal for highlevel guidelines for language construct assignment to ANSI colors

Since generally only the 8 ANSI colors and their bright alternatives are themable in most terminal emulators, the highlighting scheme needs to restrict itself to 16 colors to comply with principle **C.1** and **B.3**.
Thus, color themes that implement this highlighting scheme are assignments of colors to ANSI color numbers.

To comply with principle **B.1** and **B.2** we need to formulate a loose guideline for what kind of language constructs should be assigned to which color numbers.
This is a global loose guideline, but language specific support can overrule this if it makes the scheme comply better with design requirements 1 and 2.
The guideline is based on common patterns seen in popular syntax highlighting themes and the ability to allow colorschemes to comply with the other design principles.

To make principle **A.1** feasible for color theme designers, the language construction assignment should make sure that the first 8 colors are assigned fairly balanced among each other and assigned more frequently on average than the last 8 colors.
This way color theme designers can make sure that the first 8 colors form a nicely balanced palette and be assured that the resulting color theme will balanced consistently across languages.

### For programming languages

| Color Number | Name | Description |
| ------------ | ---- | ----------- |
| 0 | black | low emphasis, comments
| 1 | red | value types, tags, builtin types
| 2 | green | strings
| 3 | yellow | types, attributes
| 4 | blue | operators, functions
| 5 | magenta | keywords
| 6 | cyan | medium emphasis, miscellaneous
| 7 | white | regular text, variables
| 8 | bright black | alternative low emphasis
| 9 | bright red | high emphasis, constants, numbers
| a | bright green | high emphasis
| b | bright yellow | alternative types
| c | bright blue | alternative operators, functions, variables
| d | bright magenta | alternative keywords
| e | bright cyan | punctuation
| f | bright white | alternative variables

For non-typed languages the `Type` category can be interpreted more broadly as types of language constructions.

### For markup languages

*To be done.*

<!-- | Color Number | Name | Description |
| ------------ | ---- | ----------- |
| 0 | black | low emphasis
| 1 | red | emphasis, bold, tags
| 2 | green | headers, strings
| 3 | yellow | headers
| 4 | blue | miscellaneous
| 5 | magenta | inline code
| 6 | cyan | quotes
| 7 | white | regular text
| 8 | bright black | low emphasis, comments
| 9 | bright red | numbers, data
| a | bright green | links
| b | bright yellow | headers with emphasis, attributes
| c | bright blue | miscellaneous
| d | bright magenta | miscellaneous
| e | bright cyan | punctuation
| f | bright white | emphasis, italic -->

A bright variant generally has more accent than its regular counterpart, but this is not required.
Moreover, in a light color theme the color with more accent would often actually be darker.

A color theme can in principle assign arbitrary colors to each ANSI color number.
E.g. ANSI color number 6 does not necessarily have to be (close to) cyan.
However, not all assignments will result in syntax highlighting schemes that promote readibility and consistency as stated in the design principles.
Moreover, if the assignment is more or less compatible with the ANSI colors, it means that the the resulting syntax highlighting scheme will be more compatible with other schemes and is more suitable as a drop-in replacement for a terminal color theme.
But all this is subject to the discretion of the color theme designer.

## Implementation for TextMate scopes

To aid in realizing principles **C.2** and **C.3** we implement a simple TextMate theme generator based on a palette of colors using a fixed language construct assignment strategy.
Language constructs are called "scopes" in TextMate terminology.
The scope assignment template collection can be found in [templates/](https://github.com/chtenb/ansi16/tree/main/templates).
We generate an example set of themes from the palettes defined in [palettes/](https://github.com/chtenb/ansi16/tree/main/palettes).
The resulting themes are in [output/](https://github.com/chtenb/ansi16/tree/main/output).

### Usage in VSCode

See [VSCode Ansi 16](https://github.com/chtenb/vscode-ansi16).

### Usage in Terminal tools

The file [ansi16.thTheme](https://github.com/chtenb/ansi16/blob/main/output/ansi16.tmTheme) contains a definition of the ansi16 highlighting logic in terms of the 16 ANSI terminal colors.
Any terminal application that can read tmThemes can make use of this, like [bat](https://github.com/sharkdp/bat) and by extension [delta](https://github.com/dandavison/delta).
If the terminal colors are setup to match the color theme in your editor, the syntax highlighting in your terminal git diffs will look the same as in your text editor.
Note that the themes provided in the [VSCode Ansi 16](https://github.com/chtenb/vscode-ansi16) will automatically set the terminal color palette for you in the integrated terminal emulator.

### Potential shortcomings

Since we only concern ourselves with assigning colors to scopes, the grammar used to define the scopes for a language may still differ between different tools and therefor give slightly different results.
