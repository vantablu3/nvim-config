local cmp = require "cmp"

cmp.setup{
  -- all of the mappings copied (for now) from tjdevries

  mapping = {
      ["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
      ["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
      ["<C-d>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-e>"] = cmp.mapping.abort(),
      ["<c-y>"] = cmp.mapping(
        cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Insert,
          select = true,
        },
        { "i", "c" }
      ),
  
      ["<c-space>"] = cmp.mapping {
        i = cmp.mapping.complete(),
        c = function(
          _ --[[fallback]]
        )
          if cmp.visible() then
            if not cmp.confirm { select = true } then
              return
            end
          else
            cmp.complete()
          end
        end,
      },
      --
      -- no tab i guess
      ["<tab>"] = cmp.config.disable,
      --
      -- Testing
      ["<c-q>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
  },
  --
  sources = {
    { name = 'nvim_lsp' },
    { name = "path" },
    { name = "buffer", keyword_length = 5, max_item_count = 3},
    { name = 'spell', keyword_length = 6, max_item_count = 4 },
  },
}
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

require('lspconfig')['sumneko_lua'].setup {
    capabilities = capabilities
  }
