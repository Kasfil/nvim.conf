import("neorg", function(neorg)
  neorg.setup({
    load = {
      ["core.defaults"] = {},
      ["core.norg.concealer"] = {},
      ["core.norg.completion"] = { config = { engine = "nvim-cmp" } },
      ["core.presenter"] = { config = { zen_mode = "truezen" } },
      ["core.norg.dirman"] = {
        config = {
          workspaces = {
            work = "~/Documents/neorg/work",
            home = "~/Documents/neorg/notes",
            sided = "~/Documents/neorg/sided",
          },
        },
      },
    },
  })
end)
