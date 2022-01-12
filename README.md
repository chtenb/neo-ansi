# ansi16

## Design requirements for a syntax highlighting scheme

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
   Since generally only the 8 ANSI colors and their bright alternatives are themable in most terminal emulators, the scheme needs to restrict itself to 16 colors that are more or less ANSI compatible.

## Proposal for language construct assignment to ANSI colors

<span style="color:blue">some *blue* text</span>.

## Implementation for TextMate scopes
