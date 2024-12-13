-- author: 'chtenb'
-- name: 'Synthwave Material-neo-ansi'

return {
  foreground = "#cccccc",
  background = "#262335",
  cursor_bg = "#ffffff",
  cursor_border = "#ffffff",
  cursor_fg = "black",
  selection_bg = "#713c5b",
  selection_fg = "#cccccc",

  ansi = {
    "#858aaa",   -- black
    "#f07178",     -- red
    "#c3e88d",   -- green
    "#ffcb6b",  -- yellow
    "#94afeb",    -- blue
    "#c792ea", -- magenta
    "#b9dedf",    -- cyan
    "#b4b8d0",   -- white
  },

  brights = {
    "#a3a7bf",   -- bright black
    "#ff5370",     -- bright red
    "#87de97",   -- bright green
    "#f78c6c",  -- bright yellow
    "#b9dedf",    -- bright blue
    "#c792ea", -- bright magenta
    "#8ee2e5",    -- bright cyan
    "#dddddd",   -- bright white
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

    [232] = "#262335", -- e8
    [233] = "#2c2a3e", -- e9
    [234] = "#333248", -- ea
    [235] = "#393951", -- eb
    [236] = "#40415b", -- ec
    [237] = "#464965", -- ed
    [238] = "#4d5170", -- ee
    [239] = "#54597a", -- ef
    [240] = "#713c5b", -- f0
    [241] = "#513745", -- f1
    [242] = "#51444b", -- f2
    [243] = "#505050", -- f3

    [244] = "#555555", -- f4
    [245] = "#616162", -- f5
    [246] = "#6e6e6f", -- f6
    [247] = "#7b7b7c", -- f7
    [248] = "#88888a", -- f8
    [249] = "#959598", -- f9
    [250] = "#a2a3a6", -- fa
    [251] = "#b0b1b4", -- fb
    [252] = "#bebfc3", -- fc
    [253] = "#cccdd2", -- fd
    [254] = "#dbdbe1", -- fe
    [255] = "#e9eaf0", -- ff

    -- UI variants of base text colors (No readability requirement, optimize for looks)
    [226] = "#ffcb6b" -- Yellow; warning

  },
}