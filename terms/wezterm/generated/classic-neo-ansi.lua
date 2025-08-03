-- author: 'chtenb'
-- name: 'Classic-neo-ansi'

return {
  foreground = "#f3a50f",
  background = "#000000",
  cursor_bg = "#c7c7c7",
  cursor_border = "#c7c7c7",
  cursor_fg = "#ffffff",
  selection_bg = "#6b5b02",
  selection_fg = "#67e000",

  ansi = {
    "#888888",   -- black
    "#ff6e67",     -- red
    "#5ffa68",   -- green
    "#fffc67",  -- yellow
    "#1e90ff",    -- blue
    "#ff77ff", -- magenta
    "#60fdff",    -- cyan
    "#dddddd",   -- white
  },

  brights = {
    "#999999",   -- bright black
    "#ff4444",     -- bright red
    "#44ff44",   -- bright green
    "#ffff44",  -- bright yellow
    "#1e90ff",    -- bright blue
    "#ff44ff", -- bright magenta
    "44ffff",    -- bright cyan
    "#ffffff",   -- bright white
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
    [233] = "#100b04", -- e9
    [234] = "#1b1307", -- ea
    [235] = "#23190b", -- eb
    [236] = "#2b1f0e", -- ec
    [237] = "#342510", -- ed
    [238] = "#3d2b11", -- ee
    [239] = "#473213", -- ef
    [240] = "#503814", -- f0
    [241] = "#5a3f14", -- f1
    [242] = "#644415", -- f2
    [243] = "#6e4c16", -- f3

    [244] = "#795316", -- f4
    [245] = "#835a17", -- f5
    [246] = "#8e6117", -- f6
    [247] = "#986917", -- f7
    [248] = "#a37017", -- f8
    [249] = "#ae7717", -- f9
    [250] = "#ba7e16", -- fa
    [251] = "#c58715", -- fb
    [252] = "#d08e14", -- fc
    [253] = "#dc9613", -- fd
    [254] = "#e79c11", -- fe
    [255] = "#f3a30f", -- ff

    -- UI variants of base text colors (No readability requirement, optimize for looks)
    [226] = "#c7c400" -- Yellow; warning

  },
}
