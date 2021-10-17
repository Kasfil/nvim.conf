local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local events = require("luasnip.util.events")

ls.snippets = {
    python = {
        s("adef", {
            t("async def "),
            i(1, "function_name"),
            t("("),
            i(2, "param"),
            t(")"),
            c(3, {
                i(1, " -> return_type"),
                sn(1, {
                    t(" -> "),
                    i(1, "return_type"),
                }),
            }),
            t({":", ""}),
            t("\t"),
            i(0, "pass")
        })
    }
}

ls.filetype_extend("python", {"python"})
