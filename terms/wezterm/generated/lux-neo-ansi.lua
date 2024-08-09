-- author: 'chtenb'
-- name: 'Lux-neo-ansi'

return {
  foreground = "#005661",
  background = "#fefaf2",
  cursor_bg = "#005661",
  cursor_border = "#005661",
  cursor_fg = "#ffffff",
  selection_bg = "#cfe7f0",
  selection_fg = "#005661",

  ansi = {
    "#8ca6a6",   -- black
    "#e64100",     -- red
    "#00b368",   -- green
    "#fa8900",  -- yellow
    "#0095a8",    -- blue
    "#ff5792", -- magenta
    "#00bdd6",    -- cyan
    "#005661",   -- white
  },

  brights = {
    "#8ca6a6",   -- bright black
    "#e5164a",     -- bright red
    "#00b368",   -- bright green
    "#b3694d",  -- bright yellow
    "#0094f0",    -- bright blue
    "#ff5792", -- bright magenta
    "#00bdd6",    -- bright cyan
    "#004d57",   -- bright white
  },


  indexed = {
    -- background colors for git diffs
    [52] = "#fbdada",       -- red
    [88] = "#f6b6b6",   -- red emph
    [22] = "#d6ffd6",     -- green
    [28] = "#adffad", -- green emph
    [53] = "#feecf7",    -- purple
    [17] = "#e5dff6",      -- blue
    [23] = "#d8fdf6",      -- cyan
    [58] = "#f4ffe0",    -- yellow

    -- Colors 232-255 are UI colors

    -- bg - all ansi base colors must be readable against these, including the default foreground color
    [232] = "#fefaf2", -- e8: background #1 background
    [233] = "#f1e7c9", -- e9: background #2 overlay background
    [234] = "#f0e0c0", -- ea: background #3 inactive background
    [235] = "#f0e0c0", -- eb: background #4 inactive overlay background
    [236] = "#e3ded3", -- ec: alt background #1 overlay title bar
    [237] = "#efebdf", -- ed: alt background #2 inactive main title bar
    [238] = "#efe9d5", -- ee: alt background #3 main title bar
    [239] = "#d8eef1", -- ef: alt background #4 special highlight
    [240] = "#daedeb", -- f0: selection #1 inactive selection
    [241] = "#d8eef1", -- f1: selection #2 active selection
    [242] = "#d6f3fa", -- f2: selection #3 inactive primary selection
    [243] = "#d6f3fa", -- f3: selection #4 active primary selection
    -- fg - the default background color must be readable against these in inverse mode
    [244] = "#8ca6a6", -- f4: Inactive inverse fg
    [245] = "#efe9d5", -- f5: Soft inverse fg
    [246] = "#fefaf2", -- f6: Regular inverse fg
    [247] = "#ffffff", -- f7: Highlighted inverse fg
    [248] = "#58868a", -- f8:
    [249] = "#4b7e83", -- f9:
    [250] = "#3e767c", -- fa:
    [251] = "#316e75", -- fb:
    [252] = "#24666e", -- fc:
    [253] = "#175e67", -- fd:
    [254] = "#0a5660", -- fe:
    [255] = "#004d57", -- ff: active text

    -- UI variants of base text colors (No readability requirement, optimize for looks)
    [226] = "#fa8900" -- Yellow; warning

  },

  tab_bar = {
    background = "#f0e0c0",
    inactive_tab_edge = "#f0e0c0",
    inactive_tab_edge_hover = "#f0e0c0",

    active_tab = {
      bg_color = "#fefaf2",
      fg_color = "#0a5660",
      -- italic = false,
      -- strikethrough = false,
      -- underline = "None",
      -- intensity = "Normal",
    },

    inactive_tab = {
      bg_color = "#f0e0c0",
      fg_color = "#004d57",
    },

    inactive_tab_hover = {
      bg_color = "#daedeb",
      fg_color = "#004d57",
    },

    new_tab = {
      bg_color = "#f0e0c0",
      fg_color = "#004d57",
    },

    new_tab_hover = {
      bg_color = "#f0e0c0",
      fg_color = "#0095a8",
      intensity = "Bold",
    },
  },
}
