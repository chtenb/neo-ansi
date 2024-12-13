-- author: 'chtenb'
-- name: 'Tropical-neo-ansi'

return {
  foreground = "#005661",
  background = "#fefaf2",
  cursor_bg = "#005661",
  cursor_border = "#005661",
  cursor_fg = "#ffffff",
  selection_bg = "#d6f3fa",
  selection_fg = "#005661",

  ansi = {
    "#9fb4bf",   -- black
    "#fc3841",     -- red
    "#12d66b",   -- green
    "#fed221",  -- yellow
    "#37b6ff",    -- blue
    "#fc226e", -- magenta
    "#00d99b",    -- cyan
    "#535353",   -- white
  },

  brights = {
    "#a1b0b8",   -- bright black
    "#fc453b",     -- bright red
    "#10af35",   -- bright green
    "#ca9b01",  -- bright yellow
    "#70cfff",    -- bright blue
    "#fc347a", -- bright magenta
    "#009f77",    -- bright cyan
    "#444444",   -- bright white
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

    [232] = "#fefaf2", -- e8
    [233] = "#faf1e1", -- e9
    [234] = "#f5e9d1", -- ea
    [235] = "#f0e0c0", -- eb
    [236] = "#f4eee2", -- ec
    [237] = "#eae3d7", -- ed
    [238] = "#e0dacc", -- ee
    [239] = "#d6cfc0", -- ef
    [240] = "#d6f3fa", -- f0
    [241] = "#d8f0f4", -- f1
    [242] = "#dbedef", -- f2
    [243] = "#ddeae9", -- f3

    [244] = "#8ca6a6", -- f4
    [245] = "#819d9e", -- f5
    [246] = "#769597", -- f6
    [247] = "#6b8d90", -- f7
    [248] = "#608488", -- f8
    [249] = "#557c81", -- f9
    [250] = "#4a747a", -- fa
    [251] = "#3e6c73", -- fb
    [252] = "#33646c", -- fc
    [253] = "#265c65", -- fd
    [254] = "#17545e", -- fe
    [255] = "#004d57", -- ff

    -- UI variants of base text colors (No readability requirement, optimize for looks)
    [226] = "#fa8900" -- Yellow; warning

  },
}