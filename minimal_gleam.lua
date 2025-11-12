-- Minimal gleam R3adme 2025
-- place config in: ~/.config/nvim/colors/minimal_gleam.lua
-- in your init.lua:
-- vim.o.termguicolors = true
-- vim.cmd("colorscheme minimal_gleam")

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end
vim.g.colors_name = "minimal_gleam"

-- Helper function to make setting highlights cleaner
local function hl(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

local colors = {
  normal = "#ffffff",
  normal_dim = "#9c9c9c",
  background = "#1a1a1a",
  visual_bg = "#3a3a3a",
  visual_fg = "#FAF0F5",
  strings = "#cafba7",
  errors = "#fb309b",
  warnings = "#484848",
  comments = "#e6ae00", -- "#F68FE7", -- "#00ffed",
  greyed_comments = "#454545",
  type = "#899DC0",
  constructor = "#eddeff",
  definitions = "#66BEEA",
  parameter = "#c99cff",
  search_bg = "#3a3a3a",
  search_fg = "#57F3C3",
  substitute_bg = "#57f3c3",
  substitute_fg = "#1a1a1a",
  dark_grey = "#777777",
  light_pink = "#FEAED0",
}

-- Base groups
hl("Normal", { fg = colors.normal, bg = colors.background })
hl("NormalDimmed", { fg = colors.normal_dim })
hl("Comment", { fg = colors.comments })
hl("String", { fg = colors.strings })
hl("Constant", { link = "Normal" })
hl("Function", { fg = colors.definitions })
hl("TypeDef", { link = "Function" })
hl("Structure", { link = "Normal" })
hl("Operator", { fg = colors.normal_dim })
hl("Error", { fg = colors.errors })
hl("Warning", { fg = colors.warnings })
hl("Visual", { fg = colors.visual_fg, bg = colors.visual_bg })
hl("Todo", { fg = colors.warnings, bold = true })
hl("Underlined", { fg = colors.normal, underline = true })

-- Search and substitute highlighting
hl("Search", { fg = colors.search_fg, bg = colors.search_bg, bold = true })
hl("IncSearch", { fg = colors.search_fg, bg = colors.search_bg, bold = true, underline = true })
hl("CurSearch", { link = "IncSearch" })
hl("Substitute", { fg = colors.substitute_fg, bg = colors.substitute_bg, bold = true })

-- Quickfix specific styling
hl("QuickFixLine", { fg = colors.substitute_fg, bg = colors.light_pink, bold = true })
hl("qfNormal", { fg = colors.dark_grey, bg = colors.background })
hl("qfError", { fg = colors.errors })


hl("qfFileName", { link = "qfNormal" })
hl("qfLineNr", { link = "qfNormal" })
hl("qfSeparator1", { link = "qfNormal" })
hl("qfSeparator2", { link = "qfNormal" })
hl("qfText", { link = "qfNormal" })


vim.api.nvim_create_augroup("MinimalGleamQuickFix", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  pattern = "qf",
  command = "setlocal winhighlight=Normal:qfNormal",
  group = "MinimalGleamQuickFix",
})

-- Minimalist groups (linked to Normal for efficiency)

-- conflicting with your explicit definitions below.
local minimalist_groups = {
  "Identifier", "Keyword", "Statement", "Conditional", "Repeat",
  "Label", "Exception", "PreProc", "Include", "Define", "Macro",
  "PreCondit", "StorageClass", "Special",
  "SpecialChar", "Tag", "Delimiter", "SpecialComment", "Debug", "Ignore",
}

for _, group in ipairs(minimalist_groups) do
  hl(group, { link = "Normal" })
end

-- Tree-sitter groups
hl("@function", { link = "Function" })
hl("@function.call", { link = "Normal" })
hl("@variable.parameter", { fg = colors.parameter })
-- hl("@variable.member", { link = "@variable.parameter" })
hl("@punctuation", { link = "NormalDimmed" })
hl("@punctuation.special", { link = "@punctuation" })
-- hl("@type", { fg = colors.type })
-- hl("@module", { link = "@type" })
hl("@boolean", { fg = colors.constructor })
hl("@constructor", { link = "Normal" })
hl("@variable", { link = "Normal" })
hl("@property", { link = "Normal" })
hl("@keyword", { link = "Normal" })
hl("@string", { link = "String" })
hl("@operator", { link = "Operator" })
hl("@comment.gleam", { fg = colors.greyed_comments })
hl("@comment.documentation.gleam", { link = "Comment" })
hl("@comment", { link = "Comment" })
hl("@constant", { link = "Constant" })
hl("@constant.builtin", { link = "Constant" })

-- LSP Diagnostics
hl("DiagnosticError", { fg = colors.errors })
hl("DiagnosticWarn", { fg = colors.warnings })
hl("DiagnosticInfo", { fg = colors.dark_grey })
hl("DiagnosticHint", { link = "DiagnosticInfo" })

-- LSP References

hl("LspReferenceText", { link = "Visual" })
hl("LspReferenceRead", { link = "Visual" })
hl("LspReferenceWrite", { link = "Visual" })
