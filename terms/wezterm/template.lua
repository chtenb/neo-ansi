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

    -- bg - all ansi base colors must be readable against these, including the default foreground color
    [232] = "$bg01", -- e8: background #1 background
    [233] = "$bg02", -- e9: background #2 overlay background
    [234] = "$bg03", -- ea: background #3 inactive background
    [235] = "$bg04", -- eb: background #4 inactive overlay background
    [236] = "$bg05", -- ec: alt background #1 overlay title bar
    [237] = "$bg06", -- ed: alt background #2 inactive main title bar
    [238] = "$bg07", -- ee: alt background #3 main title bar
    [239] = "$bg08", -- ef: alt background #4 special highlight
    [240] = "$bg09", -- f0: selection #1 inactive selection
    [241] = "$bg10", -- f1: selection #2 active selection
    [242] = "$bg11", -- f2: selection #3 inactive primary selection
    [243] = "$bg12", -- f3: selection #4 active primary selection
    -- fg - the default background color must be readable against these in inverse mode
    [244] = "$fg12", -- f4: Inactive inverse fg
    [245] = "$fg11", -- f5: Soft inverse fg
    [246] = "$fg10", -- f6: Regular inverse fg
    [247] = "$fg09", -- f7: Highlighted inverse fg
    [248] = "$fg08", -- f8:
    [249] = "$fg07", -- f9:
    [250] = "$fg06", -- fa:
    [251] = "$fg05", -- fb:
    [252] = "$fg04", -- fc:
    [253] = "$fg03", -- fd:
    [254] = "$fg02", -- fe:
    [255] = "$fg01", -- ff: active text

    -- UI variants of base text colors (No readability requirement, optimize for looks)
    [226] = "$uiYellow" -- Yellow; warning

  },

  tab_bar = {
    background = "$bg03",
    inactive_tab_edge = "$bg03",
    inactive_tab_edge_hover = "$bg03",

    active_tab = {
      bg_color = "$background",
      fg_color = "$fg02",
      -- italic = false,
      -- strikethrough = false,
      -- underline = "None",
      -- intensity = "Normal",
    },

    inactive_tab = {
      bg_color = "$bg03",
      fg_color = "$fg01",
    },

    inactive_tab_hover = {
      bg_color = "$bg09",
      fg_color = "$fg01",
    },

    new_tab = {
      bg_color = "$bg03",
      fg_color = "$fg01",
    },

    new_tab_hover = {
      bg_color = "$bg03",
      fg_color = "$blue",
      intensity = "Bold",
    },
  },
}
