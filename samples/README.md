<p align="center">
  <img width=400px src="https://user-images.githubusercontent.com/52205/147996902-9829bd3f-cd33-466e-833e-49a6f3ebd623.png" alt="image" />
</p>
<p align="center">
  <a href="https://github.com/dandavison/delta/actions">
    <img src="https://github.com/dandavison/delta/workflows/Continuous%20Integration/badge.svg" alt="CI">
  </a>
  <a href="https://coveralls.io/github/dandavison/delta?branch=master">
    <img src="https://coveralls.io/repos/github/dandavison/delta/badge.svg?branch=master" alt="Coverage Status">
  </a>
  <a href="https://gitter.im/dandavison-delta/community?utm_source=badge&amp;utm_medium=badge&amp;utm_campaign=pr-badge">
    <img src="https://badges.gitter.im/dandavison-delta/community.svg" alt="Gitter">
  </a>
</p>

## Get Started

> Test
> Test
> Test
> Test
> Test

*test*
_test_
__test__
**test**

    asdfjlkasdjflkasdjf

[Install](#installation) delta and add this to your `~/.gitconfig`:

```gitconfig
[core]
    pager = delta

[interactive]
    diffFilter = delta --color-only

[delta]
    navigate = true

[merge]
    conflictstyle = diff3

[diff]
    colorMoved = default

```

## A syntax-highlighting pager for git, diff, and grep output

Code evolves, and we all spend time studying diffs. Delta aims to make this both efficient and enjoyable: it allows you to make extensive changes to the layout and styling of diffs, as well as allowing you to stay arbitrarily close to the default git/diff output.

<table>
  <tr>
    <td>
      <img width=400px src="https://user-images.githubusercontent.com/52205/86275526-76792100-bba1-11ea-9e78-6be9baa80b29.png" alt="image" />
      <br>
      <sub>delta with <code>line-numbers</code> activated</sub>
    </td>
  </tr>
</table>

<table>
  <tr>
    <td>
      <img width=800px src="https://user-images.githubusercontent.com/52205/87230973-412eb900-c381-11ea-8aec-cc200290bd1b.png" alt="image" />
      <br>
      <sub>delta with <code>side-by-side</code> and <code>line-numbers</code> activated</sub>
    </td>
  </tr>
</table>

# Contents

- [Features](#features)
- [Installation](#installation)
- [Configuration](#configuration)
  - [Git config file](#git-config-file)
- [How delta works](#how-delta-works)
- [Usage](#usage)
  - [Choosing colors (styles)](#choosing-colors-styles)
  - [Line numbers](#line-numbers)
  - [Side-by-side view](#side-by-side-view)
  - [Grep](#grep)
  - ["Features": named groups of settings](#features-named-groups-of-settings)
  - [Custom themes](#custom-themes)
  - [diff-highlight and diff-so-fancy emulation](#diff-highlight-and-diff-so-fancy-emulation)
  - [--color-moved support](#--color-moved-support)
  - [Navigation keybindings for large diffs](#navigation-keybindings-for-large-diffs)
  - [Merge conflicts](#merge-conflicts)
  - [Git blame](#git-blame)
  - [24 bit color (truecolor)](#24-bit-color-truecolor)
  - [Using Delta with GNU Screen](#using-delta-with-gnu-screen)
  - [Using Delta on Windows](#using-delta-on-windows)
  - [Mouse scrolling](#mouse-scrolling)
  - [Using Delta with Magit](#using-delta-with-magit)
  - [Supported languages and themes](#supported-languages-and-themes)
- [Comparisons with other tools](#comparisons-with-other-tools)
- [Build delta from source](#build-delta-from-source)
- [Related projects](#related-projects)
  - [Used by delta](#used-by-delta)
  - [Using delta](#using-delta)
  - [Similar projects](#similar-projects)
- [Full --help output](#full---help-output)
- [Delta configs used in screenshots](#delta-configs-used-in-screenshots)
  - [Side-by-side view](#side-by-side-view-1)

Here's what `git show` can look like with git configured to use delta:

<br>

<table>
  <tr>
    <td>
      <img width=500px style="border: 1px solid black"
           src="https://user-images.githubusercontent.com/52205/81058545-a5725f80-8e9c-11ea-912e-d21954586a44.png"
           alt="image" />
    </td>
    <td>
      <img width=500px style="border: 1px solid black"
           src="https://user-images.githubusercontent.com/52205/81058911-6abcf700-8e9d-11ea-93be-e212824ec03d.png"
           alt="image" />
    </td>
  </tr>
  <tr>
    <td>
      "Dracula" theme
    </td>
    <td>
      "GitHub" theme
    </td>
  </tr>
</table>

<br>
<br>

**All the syntax-highlighting color themes that are available with [bat](https://github.com/sharkdp/bat/) are available with delta:**

<br>
<table>
  <tr>
    <td>
      <img width=500px style="border: 1px solid black"
           src="https://user-images.githubusercontent.com/52205/80850197-b8f5a000-8be8-11ea-8c9e-29c5b213c4b7.png"
           alt="image" />
    </td>
    <td>
      <img width=450px style="border: 1px solid black"
           src="https://user-images.githubusercontent.com/52205/80850237-e04c6d00-8be8-11ea-9027-0d2ea62f15c2.png"
           alt="image" />
    </td>
  </tr>
  <tr>
    <td>
      <code>delta --show-syntax-themes --dark</code>
    </td>
    <td>
      <code>delta --show-syntax-themes --light</code>
    </td>
  </tr>
</table>

<br>

## Features

- Language syntax highlighting with color themes
- Within-line highlights based on a Levenshtein edit inference algorithm
- Side-by-side view with line-wrapping
- Line numbering
- `n` and `N` keybindings to move between files in large diffs, and between diffs in `log -p` views (`--navigate`)
- Improved merge conflict display
- Improved `git blame` display (syntax highlighting; `--hyperlinks` formats commits as links to GitHub/GitLab/Bitbucket etc)
- Syntax-highlights grep output from `rg`, `git grep`, `grep`, etc
- Support for Git's `--color-moved` feature.
- Code can be copied directly from the diff (`-/+` markers are removed by default).
- `diff-highlight` and `diff-so-fancy` emulation modes
- Commit hashes can be formatted as terminal [hyperlinks](https://gist.github.com/egmontkob/eb114294efbcd5adb1944c9f3cb5feda) to the GitHub/GitLab/Bitbucket page (`--hyperlinks`).
  File paths can also be formatted as hyperlinks for opening in your OS.
- Stylable box/line decorations to draw attention to commit, file and hunk header sections.
- Git style strings (foreground color, background color, font attributes) are supported for >20 stylable elements

|                                                | delta | git | [diff-so-fancy] /<br>[diff-highlight] | github/gitlab |
| ---------------------------------------------- | ----- | --- | ------------------------------------- | ------------- |
| language syntax highlighting                   | ✅    | ❌  | ❌                                    | ✅            |
| within-line insertion/deletion detection       | ✅    | ❌  | ✅                                    | ✅            |
| multiple insertion/deletions detected per line | ✅    | ❌  | ❌                                    | ✅            |
| matching of unequal numbers of changed lines   | ✅    | ❌  | ❌                                    | ❌            |
| independently stylable elements                | ✅    | ✅  | ✅                                    | ❌            |
| line numbering                                 | ✅    | ❌  | ❌                                    | ✅            |
| side-by-side view                              | ✅    | ❌  | ❌                                    | ✅            |

In addition, delta handles traditional unified diff output.

[diff-so-fancy]: https://github.com/so-fancy/diff-so-fancy
[diff-highlight]: https://github.com/git/git/tree/master/contrib/diff-highlight

## Installation

You can download an executable for your system:
[Linux (glibc)](https://github.com/dandavison/delta/releases/download/0.11.3/delta-0.11.3-x86_64-unknown-linux-gnu.tar.gz)
|
[Linux (musl)](https://github.com/dandavison/delta/releases/download/0.11.3/delta-0.11.3-x86_64-unknown-linux-musl.tar.gz)
|
[MacOS](https://github.com/dandavison/delta/releases/download/0.11.3/delta-0.11.3-x86_64-apple-darwin.tar.gz)
|
[Windows](https://github.com/dandavison/delta/releases/download/0.11.3/delta-0.11.3-x86_64-pc-windows-msvc.zip)
|
[All](https://github.com/dandavison/delta/releases)

Alternatively you can install delta using a package manager: see [repology.org/git-delta](https://repology.org/project/git-delta/versions).

Note that the package is often called `git-delta`, but the executable installed is called `delta`. Here is a quick sumary for selected package managers:

<table>
  <tr>
    <td><a href="https://archlinux.org/packages/community/x86_64/git-delta/">Arch Linux</a></td>
    <td><code>pacman -S git-delta</code></td>
  </tr>
  <tr>
    <td><a href="https://crates.io/crates/git-delta">Cargo</a></td>
    <td><code>cargo install git-delta</code></td>
  </tr>
  <tr>
    <td><a href="https://src.fedoraproject.org/rpms/rust-git-delta">Fedora</a></td>
    <td><code>dnf install git-delta</code></td>
  </tr>
  <tr>
    <td><a href="https://pkgs.org/download/git-delta">FreeBSD</a></td>
    <td><code>pkg install git-delta</code></td>
  </tr>
  <tr>
    <td><a href="https://packages.gentoo.org/packages/dev-util/git-delta">Gentoo</a></td>
    <td><code>emerge dev-util/git-delta</code></td>
  </tr>
  <tr>
    <td><a href="https://formulae.brew.sh/formula/git-delta">Homebrew</a></td>
    <td><code>brew install git-delta</code></td>
  </tr>
  <tr>
    <td><a href="https://ports.macports.org/port/git-delta/summary">MacPorts</a></td>
    <td><code>port install git-delta</code></td>
  </tr>
  <tr>
    <td><a href="https://search.nixos.org/packages?show=delta&query=delta">Nix</a></td>
    <td><code>nix-env -iA nixpkgs.delta</code>
  </tr>
  <tr>
    <td><a href="https://software.opensuse.org/package/git-delta">openSUSE Tumbleweed</a></td>
    <td><code>zypper install git-delta</code>
  </tr>
  <tr>
    <td><a href="https://github.com/void-linux/void-packages/tree/master/srcpkgs/delta">Void Linux</a></td>
    <td><code>xbps-install -S delta</code>
  </tr>
  <tr>
    <td>Windows (<a href="https://chocolatey.org/packages/delta">Chocolatey</a>)</td>
    <td><code>choco install delta</code></td>
  </tr>
  <tr>
    <td>Windows (<a href="https://scoop.sh/">Scoop</a>)</td>
    <td><code>scoop install delta</code></td>
  </tr>
  <tr>
    <td>Debian / Ubuntu</td>
    <td>
      <code>dpkg -i file.deb</code>
      <br>
      .deb files are on the <a href="https://github.com/dandavison/delta/releases">releases</a> page.
      <br>
      <sup><b>IMPORTANT</b>: If you are using Ubuntu <= 19.10 or are mixing apt sources, read <a href="https://github.com/dandavison/delta/issues/504">#504</a>, be extremely cautious, and try the versions linked against musl.</sup>
    </td>
  </tr>
</table>

Users of older MacOS versions (e.g. 10.11 El Capitan) should install using Homebrew, Cargo, or MacPorts: the binaries on the release page will not work.

Behind the scenes, delta uses [`less`](https://www.greenwoodsoftware.com/less/) for paging.
It's important to have a reasonably recent version of less installed.
On MacOS, install `less` from Homebrew. For Windows, see [Using Delta on Windows](#using-delta-on-windows).

## Configuration

#### Git config file

The most convenient way to configure delta is with a `[delta]` section in `~/.gitconfig`. Here's an example:

<sub>

```gitconfig
[core]
    pager = delta

[interactive]
    diffFilter = delta --color-only --features=interactive

[delta]
    features = decorations

[delta "interactive"]
    keep-plus-minus-markers = false

[delta "decorations"]
    commit-decoration-style = blue ol
    commit-style = raw
    file-style = omit
    hunk-header-decoration-style = blue box
    hunk-header-file-style = red
    hunk-header-line-number-style = "#067a00"
    hunk-header-style = file line-number syntax
```

</sub>

Use `delta --help` to see all the available options.

Note that delta style argument values in ~/.gitconfig should be in double quotes, like `--minus-style="syntax #340001"`. For theme names and other values, do not use quotes as they will be passed on to delta, like `theme = Monokai Extended`.

All git commands that display diff output should now display syntax-highlighted output. For example:

- `git diff`
- `git show`
- `git log -p`
- `git stash show -p`
- `git reflog -p`
- `git add -p`

To change your delta options in a one-off git command, use `git -c`. For example

```
git -c delta.line-numbers=false show
```

Delta can also be used as a shorthand for diffing two files: the following two commands do the same thing:

```
delta a.txt b.txt

git diff a.txt b.txt
```

Delta also handles unified diff format, e.g. `diff -u a.txt b.txt | delta`.

For Mercurial, you can add delta, with its command line options, to the `[pager]` section of `.hgrc`.

## How delta works

If you configure delta in gitconfig as above, then git will automatically send its output to delta.
Delta in turn passes its own output on to a "real" pager.
Note that git will only send its output to delta if git believes that its output is going to a terminal (a "tty") for a human to read.
In other words, if you do something like `git diff | grep ...` then you don't have to worry about delta changing the output from git, because delta will never be invoked at all.
If you need to force delta to be invoked when git itself would not invoke it, then you can always pipe to delta explicitly.
For example, `git diff | delta | something-that-expects-delta-output-with-colors` (in this example, git's output is being sent to a pipe, so git itself will not invoke delta).
In general however, delta's output is intended for humans, not machines.

The pager that delta uses is determined by consulting the following environment variables (in this order):

- `DELTA_PAGER`
- `PAGER`

If neither is set, delta's fallback is `less -R`.

The behavior of delta's default pager, `less`, can be controlled using the `LESS` environment variable.
It may contain any of the `less` command line options and/or interactive less-commands (prefixed by a leading `+` sign; these are executed every time right after less is launched).
For full documentation of `less` configuration options, please see the `less(1)` [manual](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/less/less.1.en).

In addition to `DELTA_PAGER`, and `PAGER`, delta currently also consults `$BAT_PAGER` (with priority between the two).
However, this is deprecated: please use `DELTA_PAGER` instead.
No other [`bat`](https://github.com/sharkdp/bat) environment variables are used by delta.

If you are interested in the implementation of delta, please see [ARCHITECTURE.md](./ARCHITECTURE.md).

## Usage

### Choosing colors (styles)

All options that have a name like `--*-style` work in the same way. It is very similar to how
colors/styles are specified in a gitconfig file:
https://git-scm.com/docs/git-config#Documentation/git-config.txt-color

Here's an example:

```gitconfig
[delta]
    minus-style = red bold ul "#ffeeee"
```

That means: For removed lines, set the foreground (text) color to 'red', make it bold and underlined, and set the background color to `#ffeeee`.

For full details, see the `STYLES` section in [`delta --help`](#full---help-output).

### Line numbers

```gitconfig
[delta]
    line-numbers = true
```

<table><tr><td><img width=400px src="https://user-images.githubusercontent.com/52205/86275526-76792100-bba1-11ea-9e78-6be9baa80b29.png" alt="image" /></td></tr></table>

The numbers are displayed in two columns and there are several configuration options: see the `LINE NUMBERS` section in [`delta --help`](#full---help-output) for details, and see the next section for an example of configuring line numbers.

### Side-by-side view

```gitconfig
[delta]
    side-by-side = true
```

By default, side-by-side view has line-numbers activated, and has syntax highlighting in both the left and right panels: [[config](#side-by-side-view-1)]

<table><tr><td><img width=800px src="https://user-images.githubusercontent.com/52205/87230973-412eb900-c381-11ea-8aec-cc200290bd1b.png" alt="image" /></td></tr></table>

To disable the line numbers in side-by-side view, but keep a vertical delimiter line between the left and right panels, use the line-numbers format options. For example:

```gitconfig
[delta]
    side-by-side = true
    line-numbers-left-format = ""
    line-numbers-right-format = "│ "
```

Long lines are wrapped if they do not fit in side-by-side mode.
In the image below, the long deleted line in the left panel overflows by a small amount, and the wrapped content is right-aligned in the next line.
In contrast, the long replacement line in the right panel overflows by almost an entire line, and so the wrapped content is left aligned in the next line. The arrow markers and ellipsis explain when and how text has been wrapped.

<table><tr><td><img width=600px src="https://user-images.githubusercontent.com/52205/139064537-f8479504-16d3-429a-b4f6-d0122438adaa.png" alt="image" /></td></tr></table>

For control over the details of line wrapping, see `--wrap-max-lines`, `--wrap-left-symbol`, `--wrap-right-symbol`, `--wrap-right-percent`, `--wrap-right-prefix-symbol`, `--inline-hint-style`.
Line wrapping was implemented by @th1000s.

### Grep

Delta applies syntax-highlighting and other enhancements to standard grep output such as from `git grep`, [ripgrep](https://github.com/BurntSushi/ripgrep/) (aka `rg`), grep, etc.
To use with `git grep`, set delta as the pager for `grep` in the `[pager]` section of your gitconfig. See the example at the [top of the page](#get-started).
Output from other grep tools can be piped to delta: e.g. `rg -Hn --color=always`, `grep -Hn --color=always`, etc.
To customize the colors and syntax highlighting, see `grep-match-line-style`, `grep-match-word-style`, `grep-contexct-line-style`, `grep-file-style`, `grep-line-number-style`.
Ripgrep's `rg --json` output format is supported; this avoids certain file name parsing ambiguities that are inevitable with the standard grep output formats.
Note that `git grep` can display the "function context" for matches and that delta handles this output specially: see the `-p` and `-W` options of `git grep`.

### "Features": named groups of settings

All delta options can go under the `[delta]` section in your git config file. However, you can also use named "features" to keep things organized: these are sections in git config like `[delta "my-feature"]`. Here's an example using two custom features:

```gitconfig
[delta]
    features = unobtrusive-line-numbers decorations
    whitespace-error-style = 22 reverse

[delta "unobtrusive-line-numbers"]
    line-numbers = true
    line-numbers-minus-style = "#444444"
    line-numbers-zero-style = "#444444"
    line-numbers-plus-style = "#444444"
    line-numbers-left-format = "{nm:>4}┊"
    line-numbers-right-format = "{np:>4}│"
    line-numbers-left-style = blue
    line-numbers-right-style = blue

[delta "decorations"]
    commit-decoration-style = bold yellow box ul
    file-style = bold yellow ul
    file-decoration-style = none
    hunk-header-decoration-style = yellow box
```

<table><tr><td><img width=400px src="https://user-images.githubusercontent.com/52205/86275048-a96ee500-bba0-11ea-8a19-584f69758aee.png" alt="image" /></td></tr></table>

### Custom themes

A "theme" in delta is just a collection of settings grouped together in a named [feature](#features-named-groups-of-settings). One of the available settings is `syntax-theme`: this dictates the colors and styles that are applied to foreground text by the syntax highlighter. Thus the concept of "theme" in delta encompasses not just the foreground syntax-highlighting color theme, but also background colors, decorations such as boxes and under/overlines, etc.

The delta git repo contains a [collection of themes](./themes.gitconfig) created by users. These focus on the visual appearance: colors etc. If you want features like `side-by-side` or `navigate`, you would set that yourself, after selecting the color theme. To use the delta themes, clone the delta repo (or download the [themes.gitconfig](./themes.gitconfig) file) and add the following entry in your gitconfig:

```gitconfig
[include]
    path = /PATH/TO/delta/themes.gitconfig
```

Then, add your chosen color theme to your features list, e.g.

```gitconfig
[delta]
    features = collared-trogon
    side-by-side = true
    ...
```

Note that this terminology differs from [bat](https://github.com/sharkdp/bat): bat does not apply background colors, and uses the term "theme" to refer to what delta calls `syntax-theme`. Delta does not have a setting named "theme": a theme is a "feature", so one uses `features` to select a theme.

### diff-highlight and diff-so-fancy emulation

Use `--diff-highlight` or `--diff-so-fancy` to activate the respective emulation mode.

You may want to know which delta configuration values the emulation mode has selected, so that you can adjust them. To do that, use e.g. `delta --diff-so-fancy --show-config`:

<table><tr><td><img width=300px src="https://user-images.githubusercontent.com/52205/86271121-5abe4c80-bb9a-11ea-950a-7c79502267d5.png" alt="image" /></td></tr></table>

[diff-highlight](https://github.com/git/git/tree/master/contrib/diff-highlight) is a perl script distributed with git that allows within-line edits to be identified and highlighted according to colors specified in git config. [diff-so-fancy](https://github.com/so-fancy/diff-so-fancy) builds on diff-highlight, making various additional improvements to the default git diff output. Both tools provide very helpful ways of viewing diffs, and so delta provides emulation modes for both of them.

The within-line highlighting rules employed by diff-highlight (and therefore by diff-so-fancy) are deliberately simpler than Delta's Levenshtein-type edit inference algorithm (see discussion in the [diff-highlight README](https://github.com/git/git/tree/master/contrib/diff-highlight)). diff-highlight's rules could be added to delta as an alternative highlighting algorithm, but that hasn't been done yet.

### `--color-moved` support

Recent versions of Git (≥ v2.17, April 2018) are able to detect moved blocks of code and style them differently from the usual removed/added lines. If you have activated this feature in Git, then Delta will automatically detect such differently-styled lines, and display them unchanged, i.e. with the raw colors it receives from Git.

To activate the Git feature, use

```gitconfig
[diff]
    colorMoved = default
```

and see the [Git documentation](https://git-scm.com/docs/git-diff#Documentation/git-diff.txt---color-movedltmodegt) for the other possible values and associated color configuration.

The `map-styles` option allows us to transform the styles that git emits for color-moved sections into delta styles.
Here's an example of using `map-styles` to assign delta styles to the raw color-moved styles output by git.
This feature allows all of git's color-moved options to be rendered using delta styles, including with syntax highlighting.

```gitconfig
[delta]
    map-styles = bold purple => syntax magenta, bold cyan => syntax blue
```

It is also possible to reference other styles.

```gitconfig
[delta]
    features = my-color-moved-theme

[delta "my-color-moved-theme"]
    git-moved-from-style = bold purple     # An ad-hoc named style (must end in "-style")

    map-styles = "my-color-moved-theme.git-moved-from-style => red #cccccc, \
                  bold cyan => syntax #cccccc"

    # we could also have defined git-moved-to-style = bold cyan
```

To make use of that, you need to know that git is emitting "bold cyan" and "bold purple".
But that's not always obvious.
To help with that, delta now has a `--parse-ansi` mode. E.g. `git show --color=always | delta --parse-ansi` outputs something like this:

<table><tr><td><img width=300px src="https://user-images.githubusercontent.com/52205/143238872-58a40754-ae50-4a9e-ba72-07e330e520e6.png" alt="image" /></td></tr></table>

As you see above, we can now define named styles in gitconfig and refer to them in places where a style string is expected.
We can also define custom named colors in git config, and styles can reference other styles; see the [hoopoe theme](https://github.com/dandavison/delta/blob/master/themes.gitconfig#L76-L91) for an example:

```gitconfig
[delta "hoopoe"]
    green = "#d0ffd0"  # ad-hoc named color
    plus-style = syntax hoopoe.green  # refer to named color
    plus-non-emph-style = plus-style  # styles can reference other styles
```

Additionally, we can now use the 140 color names that are standard in CSS. Use `delta --show-colors` to get a demo of the available colors, as background colors to see how they look with syntax highlighting:

<table><tr><td><img width=300px src="https://user-images.githubusercontent.com/52205/143237384-246db199-ef65-4ad2-ad4e-03d07d1ea41d.png" alt="image" /></td></tr></table>

### Navigation keybindings for large diffs

Use the `navigate` feature to activate navigation keybindings. In this mode, pressing `n` will jump forward to the next file in the diff, and `N` will jump backwards. If you are viewing multiple commits (e.g. via `git log -p`) then navigation will also visit commit boundaries.

### Merge conflicts

Please consider setting

```gitconfig
[merge]
    conflictstyle = diff3
```
With that setting, when a merge conflict is encountered, delta will display diffs between the ancestral commit and each of the two merge parents:

<table><tr><td><img width=500px src="https://user-images.githubusercontent.com/52205/144783121-bb549100-69d8-41b8-ac62-1704f1f7b43e.png" alt="image" /></td></tr></table>

This display can be customized using `merge-conflict-begin-symbol`, `merge-conflict-end-symbol`, `merge-conflict-ours-diff-header-style`, `merge-conflict-ours-diff-header-decoration-style`, `merge-conflict-theirs-diff-header-style`, `merge-conflict-theirs-diff-header-decoration-style`.

### Git blame

Set delta as the pager for `blame` in the `[pager]` section of your gitconfig: see the [example gitconfig](#get-started).
If `hyperlinks` is enabled in the `[delta]` section then each blame commit will link to the commit on GitHub/GitLab/Bitbucket/etc.

<table><tr><td><img width=600px src="https://user-images.githubusercontent.com/52205/141891376-1fdb87dc-1d9c-4ad6-9d72-eeb19a8aeb0b.png" alt="image" /></td></tr></table>

### 24 bit color (truecolor)

Delta looks best if your terminal application supports 24 bit colors. See https://github.com/termstandard/colors#readme. For example, on MacOS, iTerm2 supports 24-bit colors but Terminal.app does not.

If your terminal application does not support 24-bit color, delta will still work, by automatically choosing the closest color from those available. See the `Colors` section of the help output below.

If you're using tmux, it's worth checking that 24 bit color is working correctly. For example, run a color test script like [this one](https://gist.githubusercontent.com/lifepillar/09a44b8cf0f9397465614e622979107f/raw/24-bit-color.sh), or one of the others listed [here](https://gist.github.com/XVilka/8346728). If you do not see smooth color gradients, see the discussion at [tmux#696](https://github.com/tmux/tmux/issues/696). The short version is you need something like this in your `~/.tmux.conf`:

```Shell
set -ga terminal-overrides ",xterm-256color:Tc"
```

and you may then need to quit tmux completely for it to take effect.

True color output in GNU Screen is currently only possible when using a development build, as support for it is not yet implemented in the (v4) release versions. A snapshot of the latest Git trunk can be obtained via https://git.savannah.gnu.org/cgit/screen.git/snapshot/screen-master.tar.gz - the required build steps are described in the `src/INSTALL` file. After installing the program, 24-bit color support can be activated by including `truecolor on` in either the system's or the user's `screenrc` file.

### Using Delta with GNU Screen

When working in Screen without true color output, it might be that colors supposed to be different look the same in XTerm compatible terminals. If that is the case, make sure the following settings are included in your `screenrc` file:

```Shell
term screen-256color
termcapinfo xterm 'Co#256:AB=\E[48;5;%dm:AF=\E[38;5;%dm'  # ANSI (256-color) patterns - AB: background, AF: foreground
attrcolor b ".I"                                          # use bright colors for bold text
```

If despite having those settings you still only get a limited set of colors, your build of Screen might have been configured without the `--enable-colors256` flag. If this is the case, you have two options :

- If available for your OS, get a different package of Screen. Otherwise
- Build your own binary :
  - Download and extract a release tarball from https://ftp.gnu.org/gnu/screen/
  - `cd` into the newly extracted folder
  - Follow the instructions in the `INSTALL` file, and when running the `./configure` command apply the `--enable-colors256` flag.
