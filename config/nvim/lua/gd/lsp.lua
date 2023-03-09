local lspconfig = require'lspconfig'
local cmp_nvim_lsp = require'cmp_nvim_lsp'
local lsp_status = require'lsp-status'

local runtime_path = vim.split(package.path, ';')

-- local pid = vim.fn.getpid()

local function default_on_attach(client)
  print('Attaching to ' .. client.name)
  lsp_status.on_attach(client)
  vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc"
end

table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

-- Uncomment this for debugging in ~/.cache/nvim/lsp.log
-- vim.lsp.set_log_level("debug")

-- Diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    virtual_text = false, -- let g:diagnostic_enable_virtual_text = 0
    signs = true, -- let g:diagnostic_show_sign = 1
    update_in_insert = true, -- "let g:diagnostic_insert_delay = 1"
  }
)

local lspfuzzy = require 'lspfuzzy'
lspfuzzy.setup {}  -- Make the LSP client use FZF instead of the quickfix list

local servers = {
  bashls = true,
  cssls = true,
  dockerls = true,
  html = true,
  jsonls = true,
  terraformls = true,
  vimls = true,
  yamlls = true,
  sumneko_lua  = {
    settings = {
      Lua = {
        runtime = {
          version = 'LuaJIT',
          path = runtime_path,
        },
        diagnostics = {
          globals = {'vim'},
        },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
        },
        telemetry = {
          enable = false,
        },
      },
    },
  },
}

local capabilities = cmp_nvim_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())

local setup_server = function(server, config)
  if not config then
    return
  end

  if type(config) ~= "table" then
    config = {}
  end

  config = vim.tbl_deep_extend("force", {
    on_attach = default_on_attach,
    capabilities = capabilities,
  }, config)

  lspconfig[server].setup(config)
end

for server, config in pairs(servers) do
  setup_server(server, config)
end

require'lspconfig'.gopls.setup{
  capabilities = capabilities,
  cmd = {'gopls','--remote=auto'}
}

require("null-ls").setup({
  sources = {
    require("null-ls").builtins.diagnostics.vale,
  },
})
