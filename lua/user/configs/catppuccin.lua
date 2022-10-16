import({ "catppuccin", "catppuccin.palettes", "catppuccin.utils.colors" }, function(mods)
  vim.g.catppuccin_flavour = "macchiato"

  -- rosewater = "#F4DBD6",
  -- flamingo = "#F0C6C6",
  -- pink = "#F5BDE6",
  -- mauve = "#C6A0F6",
  -- red = "#ED8796",
  -- maroon = "#EE99A0",
  -- peach = "#F5A97F",
  -- yellow = "#EED49F",
  -- green = "#A6DA95",
  -- teal = "#8BD5CA",
  -- sky = "#91D7E3",
  -- sapphire = "#7DC4E4",
  -- blue = "#8AADF4",
  -- lavender = "#B7BDF8",
  -- text = "#CAD3F5",
  -- subtext1 = "#B8C0E0",
  -- subtext0 = "#A5ADCB",
  -- overlay2 = "#939AB7",
  -- overlay1 = "#8087A2",
  -- overlay0 = "#6E738D",
  -- surface2 = "#5B6078",
  -- surface1 = "#494D64",
  -- surface0 = "#363A4F",
  -- base = "#24273A",
  -- mantle = "#1E2030",
  -- crust = "#181926",

  local catppuccin = mods.catppuccin
  local pallete = mods["catppuccin.palettes"].get_palette()
  local ucolors = mods["catppuccin.utils.colors"]

  catppuccin.setup({
    custom_highlights = {
      NonText = { fg = ucolors.lighten(pallete.surface0, 1, pallete.surface0) },

      DiffDelete = {
        bg = ucolors.darken(pallete.red, 0.09, pallete.base),
        fg = pallete.surface1,
        style = { "bold" },
      },

      IndentBlanklineChar = { fg = ucolors.darken(pallete.surface0, 0.5, pallete.base) },
      IndentBlanklineContextChar = { fg = ucolors.blend(pallete.pink, pallete.base, 0.5) },

      WinSelect = { bg = pallete.yellow, fg = pallete.mantle },

      LeapBackdrop = { fg = pallete.overlay2 },
      WinBar = { bg = pallete.mantle },
      WinBarFile = { fg = pallete.teal, bg = pallete.mantle },
      WinBarFileIcon = { fg = pallete.peach, bg = pallete.mantle },

      GitSignsCurrentLineBlame = { fg = pallete.subtext0 },
      SideWin = { fg = pallete.text, bg = pallete.crust },

      DapStatusLine = { fg = pallete.maroon, bg = pallete.surface0 },
    },
    styles = {
      comments = {},
      conditionals = {},
      loops = {},
      functions = {},
      keywords = {},
      strings = {},
      variables = {},
      numbers = {},
      booleans = {},
      properties = {},
      types = {},
      operators = {},
    },
    integrations = {
      native_lsp = {
        virtual_text = {
          errors = {},
          hints = {},
          warnings = {},
          information = {},
        },
        underlines = {
          errors = {},
          hints = {},
          warnings = {},
          information = {},
        },
      },
      lsp_trouble = true,
      leap = true,
      dap = {
        enabled = true,
        enable_ui = false,
      },
      neogit = true,
      navic = {
        enabled = true,
        custom_bg = pallete.mantle,
      },
    },
  })
end)
