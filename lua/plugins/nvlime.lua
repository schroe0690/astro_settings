return {
    -- parsley (nvlimeの依存)
    {
      "monkoose/parsley",
      lazy = false,
    },
    -- nvlime本体
    {
      "monkoose/nvlime",
      dependencies = { "monkoose/parsley" },
      ft = { "lisp" }, -- Lispファイルで自動起動
      config = function()
        -- 基本設定のみ（Roswell経由でsbclを使用）
        vim.g.nvlime_config = {
          leader = ",",
          implementation = "roswell",
          address = {
            host = "127.0.0.1",
            port = 7002
          }
        }

        -- 接続関連のキーマッピング設定
        vim.g.nvlime_mappings = {
          lisp = {
            normal = {
              -- サーバー管理
              server = {
                new = ",rr",           -- 新しいサーバー起動
                show = ",rv",          -- サーバー出力表示
                stop = ",rs",          -- サーバー停止
                restart = ",rt"        -- サーバー再起動
              },

              -- 接続管理
              connection = {
                new = ",cc",           -- 新しい接続作成
                switch = ",cs",        -- 接続切り替え
                close = ",cd",         -- 接続終了
                rename = ",cR"         -- 接続名変更
              },

              -- REPL操作
              repl = {
                show = ",so",                 -- REPL表示
                clear = ",sC",                -- REPL クリア
                send_atom_expr = ",ss",       -- 式をREPLに送信
                send_expr = ",se",            -- S式をREPLに送信
                send_toplevel_expr = ",st",   -- トップレベル式を送信
                prompt = ",si"                -- REPL入力プロンプト
              }
            }
          }
        }
      end
    },
}
