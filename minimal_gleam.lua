-- Minimal gleam R3adme 2025
-- place config in:
-- ~/.config/nvim/colors/minimal_gleam.lua
-- place in your init.lua
-- vim.o.termguicolors = true
-- vim.cmd("colorscheme minimal_gleam")

vim.cmd("hi clear")

if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end

vim.g.colors_name = "minimal_gleam"

local colors = {
  normal = "#f6ecd7",
  background = "#1a1a1a",
  ld_bg = "#3a3a3a",
  visual_bg = "#2c0044",
  visual_fg_gleamy = "#f5caff",
  strings = "#57f3c3",
  errors = "#ef038f",
  warnings = "#f7c297",
  comments = "#ffecb8",
  operators = "#a8ccf1",
  definitions = "#13b3ec",
  ipairs = "#bec4ff",
  search_bg = "#ef038f",     -- pink background for search matches
  search_fg = "#ffffff",     -- white text for search matches
  substitute_bg = "#57f3c3", -- green background for substitute preview
  substitute_fg = "#1a1a1a", -- dark text for substitute preview
}

-- Base groups
vim.api.nvim_set_hl(0, "Normal", { fg = colors.normal, bg = colors.background })
vim.api.nvim_set_hl(0, "Comment", { fg = colors.comments })
vim.api.nvim_set_hl(0, "String", { fg = colors.strings })
vim.api.nvim_set_hl(0, "Constant", { fg = colors.strings })
vim.api.nvim_set_hl(0, "Function", { fg = colors.definitions })
vim.api.nvim_set_hl(0, "TypeDef", { fg = colors.definitions })
vim.api.nvim_set_hl(0, "Structure", { fg = colors.definitions })
vim.api.nvim_set_hl(0, "Operator", { fg = colors.operators })
vim.api.nvim_set_hl(0, "Error", { fg = colors.errors })
vim.api.nvim_set_hl(0, "Warning", { fg = colors.warnings })
vim.api.nvim_set_hl(0, "Visual", { fg = colors.visual_fg_gleamy, bg = colors.visual_bg })

-- Search and substitute highlighting
vim.api.nvim_set_hl(0, "Search", {
  fg = colors.search_fg,
  bg = colors.search_bg,
  bold = true
})
vim.api.nvim_set_hl(0, "IncSearch", {
  fg = colors.search_fg,
  bg = colors.search_bg,
  bold = true,
  underline = true
})
vim.api.nvim_set_hl(0, "CurSearch", {
  fg = colors.search_fg,
  bg = colors.search_bg,
  bold = true
})
vim.api.nvim_set_hl(0, "Substitute", {
  fg = colors.substitute_fg,
  bg = colors.substitute_bg,
  bold = true
})

-- Unhighlighted groups (inherit normal)
local unhighlighted = {
  "Identifier", "Keyword", "Statement", "Conditional", "Repeat",
  "Label", "Exception", "PreProc", "Include", "Define", "Macro",
  "PreCondit", "Type", "StorageClass", "Typedef", "Special",
  "SpecialChar", "Tag", "Delimiter", "SpecialComment", "Debug", "Ignore"
}

for _, group in ipairs(unhighlighted) do
  vim.api.nvim_set_hl(0, group, { fg = colors.ipairs })
end

vim.api.nvim_set_hl(0, "Todo", { fg = colors.warnings, bold = true })
vim.api.nvim_set_hl(0, "Underlined", { fg = colors.normal, underline = true })

-- Tree-sitter groups
vim.api.nvim_set_hl(0, "@function", { link = "Function" })
vim.api.nvim_set_hl(0, "@function.call", { fg = colors.normal })
vim.api.nvim_set_hl(0, "@type", { fg = colors.definitions })
vim.api.nvim_set_hl(0, "@type.definition", { fg = colors.definitions })
vim.api.nvim_set_hl(0, "@constructor", { fg = colors.normal })
vim.api.nvim_set_hl(0, "@parameter", { fg = colors.normal })
vim.api.nvim_set_hl(0, "@variable", { fg = colors.normal })
vim.api.nvim_set_hl(0, "@property", { fg = colors.normal })
vim.api.nvim_set_hl(0, "@keyword", { fg = colors.normal })
vim.api.nvim_set_hl(0, "@string", { link = "String" })
vim.api.nvim_set_hl(0, "@operator", { link = "Operator" })
vim.api.nvim_set_hl(0, "@comment", { link = "Comment" })
vim.api.nvim_set_hl(0, "@constant", { link = "Constant" })
vim.api.nvim_set_hl(0, "@constant.builtin", { fg = colors.strings })

-- LSP
vim.api.nvim_set_hl(0, "DiagnosticError", { fg = colors.errors })
vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = colors.warnings })
vim.api.nvim_set_hl(0, "LspReferenceText", { bg = colors.ld_bg })
vim.api.nvim_set_hl(0, "LspReferenceRead", { bg = colors.ld_bg })
vim.api.nvim_set_hl(0, "LspReferenceWrite", { bg = colors.ld_bg })
