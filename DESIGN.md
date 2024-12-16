# Neo-ansi Design Principles

Problems:
- The syntax highlighting quality and logic varies too much between themes.
- Text editor themes often look good on one language, but not on another.
- My git diffs in the terminal don't automatically have the same syntax highlighting logic and colors as my editor.
- Every new tool requires tweaking of color schemes to have their UI match somewhat with the other tools.
- When creating a new theme, I don't want to have to deal with all the subtilities of theme configurations of all the terminal apps I'm using. I simply want to specify a set of colors and styles to use.

Fortunately, modern terminal emulators allow you to configure what each of the 256 ANSI colors looks like, and even what font to use for any modifier codes.
This means we can treat the 256 colors and modifier escape codes as variables that we can refer to in theme configurations for terminal apps.
Then we can set these variables once in our terminal configuration, and all terminal apps would synchronously use the same theme.

There is a small thing to keep in mind: we'd like to make sure that terminal apps using standard ANSI colors and modifiers will produce logical and readable output, even without a custom configuration.
For instance, a `git diff` command should be able to use the ANSI red color to highlight deleted lines, and this should make sense.
If we don't adhere to this, we would have to reconfigure literally all terminal apps we are using, even things like npm, to make sure the output styling makes sense and is readable.
This is not feasible, because it is to tedious, and not all apps allow you to configure the colors they use.
Moreover, we'd like the first 16 base ANSI colors to be readable as a foreground color against the default terminal background.

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


### Designing color palettes

A Neo-ansi color palette is simply a set of 16 colors that attempts to follow the guidelines described above.
To make principle **A.1** feasible for color theme designers, the language construction to color assignment should make sure that the first 8 colors are assigned fairly balanced among each other and assigned more frequently on average than the last 8 colors.
This way color theme designers can make sure that the first 8 colors form a nicely balanced palette and be assured that the resulting color theme will balanced consistently across languages.

An Neo-ansi color palette can in principle assign arbitrary colors to each ANSI color number.
E.g. ANSI color number 6 does not necessarily have to be (close to) cyan.
However, not all assignments will result in syntax highlighting schemes that promote readibility and consistency as stated in the design principles.
Moreover, if the assignment is more or less compatible with the ANSI colors, it means that the the resulting syntax highlighting scheme will be more compatible with other schemes and is more suitable as a drop-in replacement for a terminal color theme.
But all this is subject to the discretion of the color theme designer.

## Implementation for TextMate scopes

Many tools support the TextMate format for syntax highlighting, including VSCode and bat.
Therefore we provide a simple implementation for  from a given Neo-ansi color palette.
Language constructs are called [scopes](https://macromates.com/manual/en/language_grammars) in TextMate terminology, and they are matched using [scope selectors](https://macromates.com/manual/en/scope_selectors).
To aid in realizing principles **C.2** and **C.3** we implement a simple tool for generating TextMate themes (.tmTheme files) based on a variable Neo-ansi color palette and a fixed scope assignment strategy.
The scope assignment logic is defined as a collection of templates which can be found in [syntax/templates/](https://github.com/chtenb/neo-ansi/tree/main/templates).
We generate an example set of TextMate themes from the Neo-ansi color palettes defined in [palettes/](https://github.com/chtenb/neo-ansi/tree/main/palettes).
The resulting `.tmTheme` files are placed in the `syntax/` directory.


