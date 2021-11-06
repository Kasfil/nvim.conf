local load_config = function()
    require("main.preload")
    require("main.options")
    require("packs")
    require("main.keymaps")
    require("lsp")
    require("main.colorscheme")
end

load_config()
