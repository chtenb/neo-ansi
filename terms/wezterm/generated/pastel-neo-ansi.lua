-- author: 'chtenb'
-- name: 'Pastel-neo-ansi'

return {
  foreground = "#bc8f8f",
  background = "#000000",
  cursor_bg = "#c7c7c7",
  cursor_border = "#c7c7c7",
  cursor_fg = "#ffffff",
  selection_bg = "#6b5b02",
  selection_fg = "#67e000",

  ansi = {
    "#888888",   -- black
    "#ffc0cb",     -- red
    "#8fbc8f",   -- green
    "#eee8aa",  -- yellow
    "#add8e6",    -- blue
    "#d8bfd8", -- magenta
    "#afeeee",    -- cyan
    "#dddddd",   -- white
  },

  brights = {
    "#999999",   -- bright black
    "#db7093",     -- bright red
    "#2e8b57",   -- bright green
    "#f0e68c",  -- bright yellow
    "#00bfff",    -- bright blue
    "#dda0dd", -- bright magenta
    "#7fffd4",    -- bright cyan
    "#ffffe0",   -- bright white
  },


  indexed = {
    -- background colors for git diffs
    [52] = "#330f0f",       -- red
    [88] = "#4f1917",   -- red emph
    [22] = "#0e2f19",     -- green
    [28] = "#174525", -- green emph
    [53] = "#330f29",    -- purple
    [17] = "#271344",      -- blue
    [23] = "#0d3531",      -- cyan
    [58] = "#222f14",    -- yellow

    -- Colors 232-255 are UI colors

    [232] = "#000000", -- e8
    [233] = "#0f0f0e", -- e9
    [234] = "#191917", -- ea
    [235] = "#22221f", -- eb
    [236] = "#2b2b27", -- ec
    [237] = "#34342f", -- ed
    [238] = "#3e3e37", -- ee
    [239] = "#484840", -- ef
    [240] = "#525249", -- f0
    [241] = "#5c5c52", -- f1
    [242] = "#67675b", -- f2
    [243] = "#727165", -- f3

    [244] = "#7c7c6e", -- f4
    [245] = "#888878", -- f5
    [246] = "#939382", -- f6
    [247] = "#9e9e8c", -- f7
    [248] = "#aaaa96", -- f8
    [249] = "#b6b6a0", -- f9
    [250] = "#c2c2aa", -- fa
    [251] = "#ceceb5", -- fb
    [252] = "#dadac0", -- fc
    [253] = "#e6e6ca", -- fd
    [254] = "#f2f2d5", -- fe
    [255] = "#ffffe0", -- ff

    -- UI variants of base text colors (No readability requirement, optimize for looks)
    [226] = "#c7c400" -- Yellow; warning

  },
}
