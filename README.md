# Ansi16 Syntax Highlighting Standard

*Disclaimer: the guidelines are still in development and are subject to change.*

This standard came into being because I was dissatisfied with the current state of syntax highlighting in my VSCode environment.

- The syntax highlighting quality and logic varies too much between themes.
- VSCode themes often look good on one language, but not on another.
- My git diffs in the terminal don't automatically have the same syntax highlighting logic and colors as my editor.

In my opinion this state could be improved greatly by formulating a standard, akin to [base16](http://www.chriskempson.com/projects/base16/) but with a different set of use cases and trade offs in mind.
Unlike base16 we will just concern ourselves with foreground colors in the context of syntax highlighting and we will encourage that our color palette can be used as a color palette for an ANSI terminal without breaking compatibility with the ANSI colors.
In other words, we don't want to encourage remapping the ANSI red color to something that is not close to red, because this will make the terminal colors confusing when using terminal applications that rely on these colors and assign meaning to them.
For instance, a `git diff` command should be able to use the ANSI red color to highlight deleted lines.

The design principles are layed out in [DESIGN.md](https://github.com/chtenb/ansi16/blob/main/DESIGN.md)

## Supported languages

The Ansi16 standard and our implementation attempts to be language agnostic, and should mostly work okay for everything.
However, we've put some additional effort in syntax highlighting support for a few languages and their most commonly used TexMate grammars.
They include

C, C++, HTML, CSS, Haskell, PureScript, Javascript, JSON, Python, Rust, Several markup languages

## Usage

We provide a few `.tmTheme` files that implement the Ansi16 standard as layed out in the DESIGN.md.
Many tools understand this format, but see below for specific details per tool.

### Usage in VSCode

We've provided a collection of VSCode themes that implement the Ansi16 syntax highlighting scheme, which are available at [VSCode Ansi 16](https://github.com/chtenb/vscode-ansi16).

### Usage in bat and delta

The file [terminal-ansi16.thTheme](https://github.com/chtenb/ansi16/blob/main/terminal-ansi16.tmTheme) contains a definition of the ansi16 highlighting logic in terms of the 16 ANSI terminal colors in a format that can be understood by bat.
Any terminal applications that use `bat` for syntax highlighting (like [delta](https://github.com/dandavison/delta)) will be able to make use of this.

You can install it by copying it manually to the bat themes folder, or by cloning this repository and running `install4bat.py`.
Then you can optionally configure `terminal-ansi16` as the default theme by putting `--theme="terminal-ansi16"` in the bat config file.

If the 16 base colors of your terminal are then setup to match the 16 colors of the Ansi16 color theme in your editor, the syntax highlighting in your terminal git diffs will look the same as in your text editor.
Note that the themes provided in the [VSCode Ansi 16](https://github.com/chtenb/vscode-ansi16) will automatically set the terminal color palette for you in the integrated terminal emulator.

### Potential shortcomings

Since we only concern ourselves with assigning colors to scopes, the grammar used to define the scopes for a language may still differ between different tools and therefore give slightly different results.

## Contributing

### Improving the scope assignment logic

- Pull requests for improvements on the scope assignment logic are welcome, either by improving upon the existing [templates/](https://github.com/chtenb/ansi16/tree/main/templates) or by adding new language support.
- Pull requests to improve the generation tooling are welcome.
- Pull requests for new themes are also welcome as long as these themes have some reusability value. For other themes you can create your own Ansi16 theme collection repository. By adding this repository as a submodule you can tap into the existing TextMate theme generation logic.

### Running the tmTheme generator

- Make sure you have Python 3.4+ installed. 
- Run `./generate.py` in the root of the repository.

