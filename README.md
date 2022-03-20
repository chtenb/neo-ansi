# Ansi 16 Syntax Highlighting Standard

*Disclaimer: the guidelines are still in development and are subject to change.*

This standard came into being because I was dissatisfied with the current state of syntax highlighting in my VSCode environment.

- The syntax highlighting quality and logic varies too much between themes.
- VSCode themes often look good on one language, but not on another.
- My git diffs in the terminal don't automatically have the same syntax highlighting logic and colors as my editor.

In my opinion this state could be improved greatly by formulating a standard, akin to [base16](http://www.chriskempson.com/projects/base16/) but with a different set of use cases and trade offs in mind.
Unlike base16 we will just concern ourselves with foreground colors in the context of syntax highlighting and we will encourage that our color palette can be used as a color palette for an ANSI terminal without breaking compatibility with the ANSI colors.
In other words, we don't want to encourage remapping the ANSI red color to something that is not close to red, because this will make the terminal colors confusing when using terminal applications that rely on these colors and assign meaning to them.
For instance, a `git diff` command should be able to use the ANSI red color to highlight deleted lines.

## Design principles for a syntax highlighting scheme standard

### A) It needs help color themes to look good.

1. The colors need to be *well-balanced* for the majority of the languages.

### B). It needs to help making the code more readable.

1. The coloring needs to be consistent across languages that are similar. 
   E.g. C# and Java code should ideally be colored mostly the same.
2. The coloring needs to be consistent across color themes.
   Language constructs that are colored equally in one color theme should ideally be colored equally in another.
3. The coloring needs to be consistent across tooling.
4. The colors and accents of a color theme need to make sort of sense semantically.
   Or at least not be completely counter intuitive.

### C). It needs to be convenient to use across tooling, programming languages and color themes.

1. It should be easy to use the highlighting scheme in a terminal without breaking colors for other terminal applications. 
2. It needs to be easy to remap the colors but keep the same (high quality) highlighting logic. 
3. It needs to be easy to synchronize the syntax highlighting scheme between an editor and a terminal emulator.

## Proposal for highlevel guidelines for language construct assignment to ANSI colors

Since generally only the 8 ANSI colors and their bright alternatives are themable in most terminal emulators, the highlighting scheme needs to restrict itself to 16 colors to comply with principle **C.1** and **B.3**.
Thus, color themes that implement this highlighting scheme are assignments of colors to ANSI color numbers.

To comply with principle **B.1** and **B.2** we need to formulate a loose guideline for what kind of language constructs should be assigned to which color numbers.
Language specific support can overrule this guideline if it makes the highlighting scheme comply better with the design principles from **A** and **B**.
The guideline is very loosely based on common patterns seen in popular syntax highlighting color themes and simultaneously aims to make it easy for color theme designers to comply with the design principles.

### For programming languages

| Color Number | Name | Description |
| ------------ | ---- | ----------- |
| 0 | black | low emphasis, comment
| 1 | red | value type, tag, builtin type
| 2 | green | string
| 3 | yellow | type, attribute
| 4 | blue | operator, function
| 5 | magenta | keyword
| 6 | cyan | medium emphasis, miscellaneous
| 7 | white | regular text, variable
| 8 | bright black | alternative low emphasis
| 9 | bright red | high emphasis, constant, number
| a | bright green | high emphasis
| b | bright yellow | alternative type
| c | bright blue | alternative operator, function, variable
| d | bright magenta | alternative keyword
| e | bright cyan | punctuation
| f | bright white | alternative variable

For non-typed languages the `type` category can be interpreted more broadly as types of language constructions.

### For markup languages

| Color Number | Name | Description |
|--------------|------|-------------|
| 0 | black | low emphasis, comment
| 1 | red | emphasis, tag, bold, header
| 2 | green | emphasis, underline, string, link
| 3 | yellow | link title, attribute
| 4 | blue | inline code
| 5 | magenta | italic, description
| 6 | cyan | block quote, table
| 7 | white | regular text
| 8 | bright black | alternative low emphasis, strike
| 9 | bright red | high emphasis, bold italic, number, data
| a | bright green | miscellaneous
| b | bright yellow | miscellaneous
| c | bright blue | miscellaneous
| d | bright magenta | miscellaneous
| e | bright cyan | punctuation
| f | bright white | miscellaneous

### Designing colors palettes

An Ansi 16 color palette is simply a set of 16 colors that attempts to follow the guidelines described above.
To make principle **A.1** feasible for color theme designers, the language construction to color assignment should make sure that the first 8 colors are assigned fairly balanced among each other and assigned more frequently on average than the last 8 colors.
This way color theme designers can make sure that the first 8 colors form a nicely balanced palette and be assured that the resulting color theme will balanced consistently across languages.

An Ansi 16 color palette can in principle assign arbitrary colors to each ANSI color number.
E.g. ANSI color number 6 does not necessarily have to be (close to) cyan.
However, not all assignments will result in syntax highlighting schemes that promote readibility and consistency as stated in the design principles.
Moreover, if the assignment is more or less compatible with the ANSI colors, it means that the the resulting syntax highlighting scheme will be more compatible with other schemes and is more suitable as a drop-in replacement for a terminal color theme.
But all this is subject to the discretion of the color theme designer.

#### Light color palettes

In the proposed guidelines above, the color white is used to color regular text while black is used for low emphasis text.
This makes sense in a dark theme, but in a light theme where the background will be a light color it makes more sense the other way around.
Therefore it is recommended that color palettes that are intended for use in a light theme have their white and black colors swapped.
I.e. they would assign dark colors to `7` and `f` and assign light colors to `0` and `8`.
Strictly speaking this breaks our ANSI color compatibility, but in practice this will not hurt the ANSI compatibility much because the black and white colors are not used a lot by terminal applications and also usually do not have strong meaning.
If anything this swap will probably improve color behavior of other terminal applications, because many terminal applications assume a dark theme by default.

A bright color generally is expected to have more accent than its regular counterpart, but this is not required.
In a light color theme the color with more accent would often actually be darker instead of brighter.

## Implementation for TextMate scopes

Many tools support the TextMate format for syntax highlighting, including VSCode and bat.
Therefore we provide a simple implementation for  from a given Ansi 16 color palette.
Language constructs are called [scopes](https://macromates.com/manual/en/language_grammars) in TextMate terminology, and they are matched using [scope selectors](https://macromates.com/manual/en/scope_selectors).
To aid in realizing principles **C.2** and **C.3** we implement a simple tool for generating TextMate themes (.tmTheme files) based on a variable Ansi 16 color palette and a fixed scope assignment strategy.
The scope assignment logic is defined as a collection of templates which can be found in [templates/](https://github.com/chtenb/ansi16/tree/main/templates).
We generate an example set of TextMate themes from the Ansi 16 color palettes defined in [palettes/](https://github.com/chtenb/ansi16/tree/main/palettes).
The resulting `.tmTheme` files are placed in the root of this repository.

### Usage in VSCode

We've provided a collection of VSCode themes that implement the Ansi 16 syntax highlighting scheme, which are available at [VSCode Ansi 16](https://github.com/chtenb/vscode-ansi16).

### Usage in bat and delta

The file [terminal-ansi16.thTheme](https://github.com/chtenb/ansi16/blob/main/output/terminal-ansi16.tmTheme) contains a definition of the ansi16 highlighting logic in terms of the 16 ANSI terminal colors in a format that can be understood by bat.
Any terminal applications that use `bat` for syntax highlighting (like [delta](https://github.com/dandavison/delta)) will be able to make use of this.

You can install it by copying it manually to the bat themes folder, or by cloning this repository and running `install4bat.py`.
Then you can optionally configure `terminal-ansi16` as the default theme by putting `--theme="terminal-ansi16"` in the bat config file.

If the 16 base colors of your terminal are then setup to match the 16 colors of the Ansi 16 color theme in your editor, the syntax highlighting in your terminal git diffs will look the same as in your text editor.
Note that the themes provided in the [VSCode Ansi 16](https://github.com/chtenb/vscode-ansi16) will automatically set the terminal color palette for you in the integrated terminal emulator.

### Potential shortcomings

Since we only concern ourselves with assigning colors to scopes, the grammar used to define the scopes for a language may still differ between different tools and therefore give slightly different results.

## Contributing

### Improving the scope assignment logic

- Pull requests for improvements on the scope assignment logic are welcome, either by improving upon the existing [templates/](https://github.com/chtenb/ansi16/tree/main/templates) or by adding new language support.
- Pull requests to improve the generation tooling are welcome.
- Pull requests for new themes are also welcome as long as these themes have some reusability value. For other themes you can create your own Ansi 16 theme collection repository. By adding this repository as a submodule you can tap into the existing TextMate theme generation logic.

### Running the tmTheme generator

- Make sure you have Python 3.4+ installed. 
- Run `./generate.py` in the root of the repository.

