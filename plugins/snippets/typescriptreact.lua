local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local f = ls.function_node

return {
  s("rcomp", {
    t("interface "),
    f(function()
      local filename = vim.fn.fnamemodify(vim.fn.expand("%:t:r"), ":t")
      return filename:sub(1, 1):upper() .. filename:sub(2) .. "Props"
    end, {}),
    t({ " {", "}", "", "export default function " }),
    f(function()
      local filename = vim.fn.fnamemodify(vim.fn.expand("%:t:r"), ":t")
      return filename:sub(1, 1):upper() .. filename:sub(2)
    end, {}),
    t({ "() {", "  return (", "    <div>", "      " }),
    i(0),
    t({ "", "    </div>", "  );", "}", "" }),
  }),
}
