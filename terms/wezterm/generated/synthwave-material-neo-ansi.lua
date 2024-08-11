-- author: 'chtenb'
-- name: 'Synthwave Material-neo-ansi'

return {
  foreground = "#cccccc",
  background = "#262335",
  cursor_bg = "#ffffff",
  cursor_border = "#ffffff",
  cursor_fg = "black",
  selection_bg = "#333041",
  selection_fg = "#cccccc",

  ansi = {
    "#676e95",   -- black
    "#f07178",     -- red
    "#c3e88d",   -- green
    "#ffcb6b",  -- yellow
    "#94afeb",    -- blue
    "#c792ea", -- magenta
    "#b9dedf",    -- cyan
    "#b4b8d0",   -- white
  },

  brights = {
    "#676e95",   -- bright black
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

    -- bg - all ansi base colors must be readable against these, including the default foreground color
    [232] = "#2F2E43", -- e8: background #1 background
    [233] = "#393850", -- e9: background #2 overlay background
    [234] = "#42435E", -- ea: background #3 inactive background
    [235] = "#4B4E6C", -- eb: background #4 inactive overlay background
    [236] = "#54597A", -- ec: alt background #1 overlay title bar
    [237] = "#5E6387", -- ed: alt background #2 inactive main title bar
    [238] = "#241b30", -- ee: alt background #3 main title bar
    [239] = "#b0b0b0", -- ef: alt background #4 special highlight
    [240] = "#303030", -- f0: selection #1 inactive selection
    [241] = "#404040", -- f1: selection #2 active selection
    [242] = "#303030", -- f2: selection #3 inactive primary selection
    [243] = "#4a3a48", -- f3: selection #4 active primary selection
    -- fg - the default background color must be readable against these in inverse mode
    [244] = "#eeeeee", -- f4: Inactive inverse fg
    [245] = "#262335", -- f5: Soft inverse fg
    [246] = "#262335", -- f6: Regular inverse fg
    [247] = "#000000", -- f7: Highlighted inverse fg
    [248] = "#909090", -- f8:
    [249] = "#909090", -- f9:
    [250] = "#7D83A4", -- fa:
    [251] = "#9297B3", -- fb:
    [252] = "#A8ACC2", -- fc:
    [253] = "#BEC1D2", -- fd:
    [254] = "#D4D6E1", -- fe:
    [255] = "#E9EAF0", -- ff: active text

    -- UI variants of base text colors (No readability requirement, optimize for looks)
    [226] = "#ffcb6b" -- Yellow; warning

  },

  tab_bar = {
    background = "#42435E",
    inactive_tab_edge = "#42435E",
    inactive_tab_edge_hover = "#42435E",

    active_tab = {
      bg_color = "#262335",
      fg_color = "#D4D6E1",
      -- italic = false,
      -- strikethrough = false,
      -- underline = "None",
      -- intensity = "Normal",
    },

    inactive_tab = {
      bg_color = "#42435E",
      fg_color = "#E9EAF0",
    },

    inactive_tab_hover = {
      bg_color = "#303030",
      fg_color = "#E9EAF0",
    },

    new_tab = {
      bg_color = "#42435E",
      fg_color = "#E9EAF0",
    },

    new_tab_hover = {
      bg_color = "#42435E",
      fg_color = "#94afeb",
      intensity = "Bold",
    },
  },
}
