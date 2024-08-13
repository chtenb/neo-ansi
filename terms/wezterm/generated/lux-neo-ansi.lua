-- author: 'chtenb'
-- name: 'Lux-neo-ansi'

return {
  foreground = "#005661",
  background = "#fefaf2",
  cursor_bg = "#005661",
  cursor_border = "#005661",
  cursor_fg = "#ffffff",
  selection_bg = "#d6f3fa",
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
