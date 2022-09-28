local nnoremap = function(lhs, rhs, silent)
  vim.api.nvim_set_keymap("n", lhs, rhs, { noremap = true, silent = silent })
end

local inoremap = function(lhs, rhs, silent)
  vim.api.nvim_set_keymap("i", lhs, rhs, { noremap = true, silent = silent })
end

local snoremap = function(lhs, rhs, silent)
  vim.api.nvim_set_keymap("s", lhs, rhs, { noremap = true, silent = silent })
end

local vnoremap = function(lhs, rhs)
  vim.api.nvim_set_keymap("v", lhs, rhs, { noremap = true })
end

-- smartquit
nnoremap("qq", '<cmd>lua require("utils/smartquit")()<CR>', true)

-- Use alt + hjkl to resize windows
nnoremap("<M-j>", ":resize -2<CR>")
nnoremap("<M-k>", ":resize +2<CR>")
nnoremap("<M-h>", ":vertical resize -2<CR>")
nnoremap("<M-l>", ":vertical resize +2<CR>")

-- Escape redraws the screen and removes any search highlighting.
nnoremap("<esc>", ":noh<return><esc>")

-- Easy CAPS
inoremap("<c-u>", "<ESC>viwUi")

-- TAB in normal mode will move to text buffer
nnoremap("<TAB>", ":bnext<CR>")
-- SHIFT-TAB will go back
nnoremap("<S-TAB>", ":bprevious<CR>")

-- Better tabbing
vnoremap("<", "<gv")
vnoremap(">", ">gv")

-- Better window navigation
-- nnoremap("<C-h>", "<C-w>h")
-- nnoremap("<C-j>", "<C-w>j")
-- nnoremap("<C-k>", "<C-w>k")
-- nnoremap("<C-l>", "<C-w>l")
inoremap(
  "<C-k>",
  '<cmd>lua require("sim_config/luasnip").navigate(1)<CR>',
  true
)
snoremap(
  "<C-k>",
  '<cmd>lua require("sim_config/luasnip").navigate(1)<CR>',
  true
)
inoremap(
  "<C-j>",
  '<cmd>lua require("sim_config/luasnip").navigate(-1)<CR>',
  true
)
snoremap(
  "<C-j>",
  '<cmd>lua require("sim_config/luasnip").navigate(-1)<CR>',
  true
)

-- Map Ctrl-Backspace to delete the previous word in insert mode.
inoremap("<C-w>", "<C-\\><C-o>dB")
inoremap("<C-BS>", "<C-\\><C-o>db")

-- Symbols Outline
nnoremap("<Leader>s", ":SymbolsOutline<CR>")

nnoremap("<space>/", '<cmd>lua require("utils/comment")()<CR>')
vnoremap("<space>/", '<cmd>lua require("utils/comment")()<CR>')

-- Nvim-Tree
nnoremap("<leader>e", ":NvimTreeToggle<CR>")
nnoremap("<leader>r", ":NvimTreeRefresh<CR>")
nnoremap("<leader>n", ":NvimTreeFindFile<CR>")

-- LSP
nnoremap("gd", "<cmd>lua vim.lsp.buf.definition()<CR>", true)
nnoremap("gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", true)
nnoremap("gr", "<cmd>LspTrouble lsp_references<CR>", true)
nnoremap("gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", true)
nnoremap("<C-space>", "<cmd>lua vim.lsp.buf.hover()<CR>", true)
vnoremap("<C-space>", "<cmd>RustHoverRange<CR>")

nnoremap("ge", "<cmd>lua vim.diagnostic.goto_prev()<CR>", true)
nnoremap("gE", "<cmd>lua vim.diagnostic.goto_next()<CR>", true)
nnoremap("<silent><leader>a", "<cmd>lua vim.lsp.buf.code_action()<CR>", true)
nnoremap("<Leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", true)
nnoremap("<Leader>a", "<cmd>lua vim.lsp.buf.code_action()<CR>", true)
vnoremap("<Leader>a", "<cmd>lua vim.lsp.buf.range_code_action()<CR>")

-- Telescope
nnoremap("<C-f>", ':lua require("utils/telescope").search_files()<CR>')
nnoremap("/", ':lua require("utils/telescope").search_in_buffer()<CR>')
inoremap(
  "<C-f>",
  '<Esc> :lua require("utils/telescope").search_in_buffer()<CR>'
)

-- Rust Tool

nnoremap("<F5>", "<cmd>lua require'dap'.continue()<CR>", true)
nnoremap("<F10>", "<cmd>lua require'dap'.step_over()<CR>", true)
nnoremap("F11>", "<cmd>lua require'dap'.step_into()<CR>", true)
nnoremap("<F12>", "<cmd>lua require'dap'.step_out()<CR>", true)
nnoremap("<Leader>b", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", true)
nnoremap(
  "<Leader>B",
  "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
  true
)
nnoremap(
  "<Leader>lp",
  "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>",
  true
)
nnoremap("<Leader>dr", "<cmd>lua require'dap'.repl.open()<CR>", true)
nnoremap("<Leader>dl", "<cmd>lua require'dap'.run_last()<CR>", true)
nnoremap("<Leader>dt", "<cmd>lua require'dapui'.toggle()<CR>", true)
nnoremap("<Leader>dc", "<cmd>lua require'dapui'.close()<CR>", true)
nnoremap("<Leader>do", "<cmd>lua require'dapui'.open()<CR>", true)
