-----------------------
-- Rust
-----------------------
local ih = require("inlay-hints")
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

local rt = require("rust-tools")
local extension_path = "$HOME/codelldb-x86/extension/"
local codelldb_path = extension_path .. "adapter/codelldb"
local liblldb_path = extension_path .. "lldb/lib/liblldb.dylib"

rt.setup({
  tools = {
    inlay_hints = {
      auto = true,
      -- only_current_line = true,
      -- whether to show parameter hints with the inlay hints or not
      -- default: true
      show_parameter_hints = false,
    },
    on_initialized = function()
      ih.set_all()
    end,
  },
  server = {
    on_attach = function(client, bufnr)
      -- ih.on_attach(client, bufnr)
      vim.keymap.set(
        "n",
        "<C-space>",
        rt.hover_actions.hover_actions,
        { buffer = bufnr }
      )

      vim.keymap.set(
        "n",
        "<Leader>a",
        rt.code_action_group.code_action_group,
        { buffer = bufnr }
      )
    end,
  },
  dap = {
    -- adapter = {
    --   type = "executable",
    --   command = "lldb-vscode",
    --   name = "rt_lldb",
    -- },
    adapter = require("rust-tools.dap").get_codelldb_adapter(
      codelldb_path,
      liblldb_path
    ),
  },
})
