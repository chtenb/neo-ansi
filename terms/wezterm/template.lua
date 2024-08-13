-- author: 'chtenb'
-- name: '$name-neo-ansi'

return {
  foreground = "$foreground",
  background = "$background",
  cursor_bg = "$cursor_bg",
  cursor_border = "$cursor_border",
  cursor_fg = "$cursor_fg",
  selection_bg = "$selection_bg",
  selection_fg = "$selection_fg",

  ansi = {
    "$black",   -- black
    "$red",     -- red
    "$green",   -- green
    "$yellow",  -- yellow
    "$blue",    -- blue
    "$magenta", -- magenta
    "$cyan",    -- cyan
    "$white",   -- white
  },

  brights = {
    "$brightBlack",   -- bright black
    "$brightRed",     -- bright red
    "$brightGreen",   -- bright green
    "$brightYellow",  -- bright yellow
    "$brightBlue",    -- bright blue
    "$brightMagenta", -- bright magenta
    "$brightCyan",    -- bright cyan
    "$brightWhite",   -- bright white
  },


  indexed = {
    -- background colors for git diffs
    [52] = "$gitBgRed",       -- red
    [88] = "$gitBgRedEmph",   -- red emph
    [22] = "$gitBgGreen",     -- green
    [28] = "$gitBgGreenEmph", -- green emph
    [53] = "$gitBgPurple",    -- purple
    [17] = "$gitBgBlue",      -- blue
    [23] = "$gitBgCyan",      -- cyan
    [58] = "$gitBgYellow",    -- yellow

    -- Colors 232-255 are UI colors

    [232] = "$bg01", -- e8
    [233] = "$bg02", -- e9
    [234] = "$bg03", -- ea
    [235] = "$bg04", -- eb
    [236] = "$bg05", -- ec
    [237] = "$bg06", -- ed
    [238] = "$bg07", -- ee
    [239] = "$bg08", -- ef
    [240] = "$bg09", -- f0
    [241] = "$bg10", -- f1
    [242] = "$bg11", -- f2
    [243] = "$bg12", -- f3

    [244] = "$ac12", -- f4
    [245] = "$ac11", -- f5
    [246] = "$ac10", -- f6
    [247] = "$ac09", -- f7
    [248] = "$ac08", -- f8
    [249] = "$ac07", -- f9
    [250] = "$ac06", -- fa
    [251] = "$ac05", -- fb
    [252] = "$ac04", -- fc
    [253] = "$ac03", -- fd
    [254] = "$ac02", -- fe
    [255] = "$ac01", -- ff

    -- UI variants of base text colors (No readability requirement, optimize for looks)
    [226] = "$uiYellow" -- Yellow; warning

  },
}
