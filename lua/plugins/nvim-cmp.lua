return {
  -- nvim-cmp 本体
  'hrsh7th/nvim-cmp',

  -- 依存プラグイン
  dependencies = {
    'hrsh7th/cmp-omni', -- ★ nvlime (omnifunc) に必要
    'hrsh7th/cmp-buffer',
    -- 'L3MON4D3/LuaSnip', -- スニペットを使う場合
    -- 'saadparwaiz1/cmp_luasnip',
  },

  config = function()
    local cmp = require('cmp')

    cmp.setup({
      -- スニペットエンジンの設定（使用する場合）
      -- snippet = {
      --   expand = function(args)
      --     require('luasnip').lsp_expand(args.body)
      --   end,
      -- },

      -- 補完ウィンドウのキーマッピング
      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-k>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
      }),

      -- 補完ソースの指定
      sources = cmp.config.sources({
        { name = 'omni' },     -- ★ nvlime はこれを使います
        { name = 'buffer' },   -- バッファ内の単語
        -- { name = 'luasnip' }, -- スニペット
        -- { name = 'path' },    -- ファイルパス
      }),

      experimental = {
        ghost_text = false,
      },

			-- メモ
			-- nvlime の omnifunc 機能本体 （<C-x><C-o>で動作確認済み）
    })
  end,
}
