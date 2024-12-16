This standard came into being because I was dissatisfied with the state of syntax highlighting and general theming consistency in my coding environment.

- The syntax highlighting quality and logic varies too much between themes.
- Text editor themes often look good on one language, but not on another.
- My git diffs in the terminal don't automatically have the same syntax highlighting logic and colors as my editor.
- Every new tool requires tweaking of color schemes to have their UI match somewhat with the other tools.
- When creating a new theme, I don't want to have to deal with all the subtilities of theme configurations of all the terminal apps I'm using. I simply want to specify a set of colors and styles to use.

# Neo-ansi 

Neo-ansi is a terminal theming strategy that utilizes the flexibility of ANSI color customization in terminal emulators.
By configuring all terminal applications to rely on these ANSI colors, they seamlessly adapt to the user's chosen color scheme.
For this to work properly, ANSI color numbers need to have a well-defined meaning, so they can be used consistently across applications.

The neo-ansi standard is similar to [base16](https://github.com/chriskempson/base16), but with a different set of use cases and trade offs in mind.
For example, base16 maps the ANSI colors 0-7 to an unrelated set of colors for use in various UI elements.
However, this breaks terminal applications that assume that color 1 is red and use that for e.g. error messages.
Unlike base16, neo-ansi tries to remain mostly compatible with ANSI colors, in the sense that the colors should remain reasonable close to their intended color.
Moreover, we also allow the use of any of the extended 256 ANSI colors, not just the first 16, since modern terminals also allow customizing these.

## Text foreground colors
The first 16 colors (4-bit) are used for text and foreground.

### For programming languages

| Color Number | Name | Description |
| ------------ | ---- | ----------- |
|-1 | default | regular text, variable
| 0 | black | unused
| 1 | red | value type, tag, builtin type
| 2 | green | string
| 3 | yellow | type, attribute
| 4 | blue | operator, function
| 5 | magenta | keyword
| 6 | cyan | medium emphasis, miscellaneous
| 7 | white | alternative low emphasis
| 8 | bright black | low emphasis, comment, whitespace indicators
| 9 | bright red | high emphasis, constant, number
| a | bright green | high emphasis
| b | bright yellow | alternative type
| c | bright blue | alternative operator, function, variable
| d | bright magenta | alternative keyword
| e | bright cyan | punctuation
| f | bright white | alternative variable, mutable variable

For non-typed languages the `type` category can be interpreted more broadly as types of language constructions.

Optionally, a theme can also use non-color graphics modes to change the appearance of text, if the terminal emulator supports them.
Here are some suggestions how they could be used.

| Modifier | Name | Description |
|----------|------|-------------|
|0| Reset | default
|1| Bold | keywords, high emphasis
|2| Dim | comments, low emphasis, whitespace indicators
|3| Underline | links
|4| Italic | comments
|5| Blink |
|7| Inverse |
|8| Hidden |
|9| Strikethrough | Strikethrough markup

### For markup languages

| Color Number | Name | Description |
|--------------|------|-------------|
|-1 | default | regular text
| 0 | black | unused
| 1 | red | emphasis, tag, bold, header
| 2 | green | emphasis, underline, string, link
| 3 | yellow | link title, attribute
| 4 | blue | inline code
| 5 | magenta | italic, description
| 6 | cyan | block quote, table
| 7 | white | alternative low emphasis
| 8 | bright black | low emphasis, comment, whitespace indicators, strikethrough
| 9 | bright red | high emphasis, bold italic, number, data
| a | bright green | miscellaneous
| b | bright yellow | miscellaneous
| c | bright blue | miscellaneous
| d | bright magenta | miscellaneous
| e | bright cyan | punctuation
| f | bright white | miscellaneous


| Modifier | Name | Description |
|----------|------|-------------|
|0| Reset | default
|1| Bold | high emphasis, tag, bold, header
|2| Dim | comments, low emphasis
|3| Underline | links
|4| Italic | medium emphasis
|5| Blink |
|7| Inverse |
|8| Hidden |
|9| Strikethrough | Strikethrough markup

## Background and miscellaneous UI colors

All 16 4-bit ansi colors are used for foreground colors as specified earlier.
We can use some of the remaining 8-bit colors for backgrounds and other UI components, assuming they are customizable by the terminal emulator.

Even though colors e8-ff are gray scale according to the ANSI spec, we do not require them to be as such.
It is recommended that these colors follow a natural scale fitting to the color palette, and we will assign semantics to these in the next sections.

### Diff background colors
Readability requirement: all 4-bit colors must be readable as foreground color against these background colors.

|Hex|Dec|Name|Usage suggestion|
|---|---|----|----------------|
|34 |052|gitBgRed|git diff minus|
|58 |088|gitBgRedEmph|git diff minus emph|
|16 |022|gitBgGreen|git diff plus|
|1c |028|gitBgGreenEmph|git diff plus emph|
|35 |053|gitBgPurple|git diff purple|
|11 |017|gitBgBlue|git diff blue|
|17 |023|gitBgCyan|git diff cyan|
|3a |058|gitBgYellow|git diff yellow|

### UI Background Colors
Readability requirement: all 4-bit colors must yield readable text when combined with these background colors, in normal mode as well as reverse mode.
Brightness suggestion: colors should be in order of increasing brightness

|Hex|Dec|Name|Usage suggestion|
|---|---|----|----------------|
|e8 |232|bg01|should be the same as the default background|
|e9 |233|bg02|inactive background|
|ea |234|bg03|overlay background|
|eb |235|bg04|inactive overlay background|
|ec |236|bg05|alt/header background|
|ed |237|bg06|alt/header inactive background|
|ee |238|bg07|alt/header overlay background|
|ef |239|bg08|alt/header inactive overlay background|
|f0 |240|bg09|primary selection|
|f1 |241|bg10|inactive primary selection|
|f2 |242|bg11|secondary selections|
|f3 |243|bg12|inactive secondary selections|

### UI Accent Colors
Readability requirement: the default background color must yield readable text when combined with these accent colors, in normal mode as well as reverse mode.
Brightness suggestion: colors should be in order of increasing brightness

|Hex|Dec|Name|Usage suggestion|
|---|---|----|----------------|
|f4 |244|ac12| |
|f5 |245|ac11| |
|f6 |246|ac10| |
|f7 |247|ac09| |
|f8 |248|ac08| |
|f9 |249|ac07| |
|fa |250|ac06|should be the same as the default foreground|
|fb |251|ac05| |
|fc |252|ac04| |
|fd |253|ac03| |
|fe |254|ac02| |
|ff |255|ac01| |

### UI Non-text Colors
Colors for usage on elements that are not text, like gutters.
Hence, these do not have to adhere to the readability constraints as other colors.

|Hex|Dec|Name|Usage suggestion|
|---|---|----|----------------|


## Light color palettes

In the proposed guidelines above, the color white is used to color regular text while black is used for low emphasis text.
This makes sense in a dark theme, but in a light theme where the background will be a light color it makes more sense the other way around.
Therefore it is recommended that color palettes that are intended for use in a light theme have their white and black colors swapped.
I.e. they would assign dark colors to `7` and `f` and assign light colors to `0` and `8`.
Strictly speaking this breaks our ANSI color compatibility, but in practice this will not hurt the ANSI compatibility much because the black and white colors are not used a lot by terminal applications and also usually do not have strong meaning.
If anything this swap will probably improve color behavior of other terminal applications, because many terminal applications assume a dark theme by default.

A bright color generally is expected to have more accent than its regular counterpart, but this is not required.
In a light color theme the color with more accent would often actually be darker instead of brighter.

---

## Usage
We provide configuration for syntax highlighting in `.tmTheme` format, neo-ansi theme configuration for various terminal applications and some neo-ansi color schemes that can be used in your terminal.

### Syntax highlighting with bat
The file [terminal-neo-ansi.thTheme](https://github.com/chtenb/neo-ansi/blob/main/terminal-neo-ansi.tmTheme) contains a definition of the neo-ansi highlighting logic in terms of the 16 ANSI terminal colors in a format that can be understood by [bat](https://github.com/sharkdp/bat).
Any terminal applications that use bat for syntax highlighting (like [delta](https://github.com/dandavison/delta)) will be able to make use of this.

You can install it by cloning this repository and running `apps/bat/deploy-to-bat.py`.
Then you can optionally configure `terminal-neo-ansi` as the default theme by putting `--theme="terminal-neo-ansi"` in the bat config file.

### Usage in terminal applications
In the `apps/` directory you will find neo-ansi config for all currently supported terminal applications.
To enable neo-ansi for these apps, I recommend you symlink those config files into your own configuration.

### Setting terminal themes
In the `terms/` directory you will find a collection of terminal themes that are compliant with neo-ansi.
These are generated from palettes defined in `palettes/`.

### Usage in VSCode
We've provided a collection of VSCode themes that implement the Neo-ansi syntax highlighting scheme, which are available at [VSCode Neo-ansi](https://github.com/chtenb/vscode-neo-ansi).
These do not only theme the buitin terminal of VSCode, but also theme the VSCode UI with matching colors.

## Development
Running the theme generator:

- Make sure you have Python 3.4+ installed. 
- Make sure you have pyyaml installed.
- Run `./generate.py` in the root of the repository.

This will generate all `.tmTheme` files and all terminal themes from the palettes defined in `palettes/`.

