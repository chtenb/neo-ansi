-- author: 'chtenb'
-- name: 'Classic-neo-ansi'

return {
  foreground = "#d5a200",
  background = "#000000",
  cursor_bg = "#c7c7c7",
  cursor_border = "#c7c7c7",
  cursor_fg = "#ffffff",
  selection_bg = "#6b5b02",
  selection_fg = "#67e000",

  ansi = {
    "#777777",   -- black
    "#c91b00",     -- red
    "#00c200",   -- green
    "#c7c400",  -- yellow
    "#0071ff",    -- blue
    "#ca30c7", -- magenta
    "#00c5c7",    -- cyan
    "#c7c7c7",   -- white
  },

  brights = {
    "#999999",   -- bright black
    "#ff6e67",     -- bright red
    "#5ffa68",   -- bright green
    "#fffc67",  -- bright yellow
    "#6871ff",    -- bright blue
    "#ff77ff", -- bright magenta
    "#60fdff",    -- bright cyan
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
    [233] = "#0c0c0c", -- e9
    [234] = "#141414", -- ea
    [235] = "#1a1a1a", -- eb
    [236] = "#212121", -- ec
    [237] = "#272727", -- ed
    [238] = "#2e2e2e", -- ee
    [239] = "#353535", -- ef
    [240] = "#3c3c3c", -- f0
    [241] = "#434343", -- f1
    [242] = "#4b4b4b", -- f2
    [243] = "#525252", -- f3

    [244] = "#7c7c7c", -- f4
    [245] = "#888888", -- f5
    [246] = "#939393", -- f6
    [247] = "#9e9e9e", -- f7
    [248] = "#aaaaaa", -- f8
    [249] = "#b6b6b6", -- f9
    [250] = "#c2c2c2", -- fa
    [251] = "#cecece", -- fb
    [252] = "#dadada", -- fc
    [253] = "#e6e6e6", -- fd
    [254] = "#f2f2f2", -- fe
    [255] = "#ffffff", -- ff

    -- UI variants of base text colors (No readability requirement, optimize for looks)
    [226] = "#c7c400" -- Yellow; warning

  },

  tab_bar = {
    background = "#141414",
    inactive_tab_edge = "#141414",
    inactive_tab_edge_hover = "#141414",

    active_tab = {
      bg_color = "#000000",
      fg_color = "#f2f2f2",
      -- italic = false,
      -- strikethrough = false,
      -- underline = "None",
      -- intensity = "Normal",
    },

    inactive_tab = {
      bg_color = "#141414",
      fg_color = "#ffffff",
    },

    inactive_tab_hover = {
      bg_color = "#3c3c3c",
      fg_color = "#ffffff",
    },

    new_tab = {
      bg_color = "#141414",
      fg_color = "#ffffff",
    },

    new_tab_hover = {
      bg_color = "#141414",
      fg_color = "#0071ff",
      intensity = "Bold",
    },
  },
}
