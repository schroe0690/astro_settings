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
        -- sbclラッパーを使用（デフォルト設定）
        -- ラッパーが /usr/local/bin/sbcl にあるので、カスタム設定は不要
        
        -- nvlime設定
        vim.g.nvlime_config = {
          leader = ",",           -- 押しやすいカンマに変更
          implementation = "sbcl", -- デフォルトのsbcl（ラッパー経由でroswell）
          
          -- サーバー接続設定
          address = {
            host = "127.0.0.1",   -- サーバーのホスト
            port = 7002           -- サーバーのポート
          },
          connect_timeout = 10000, -- 接続タイムアウト（10秒に延長）
          
          -- 自動ドキュメント表示
          autodoc = {
            enabled = true,       -- 引数リスト自動表示
            max_level = 5,        -- 検索する括弧の階層数
            max_lines = 50        -- 検索する行数
          },
          
          -- メインウィンドウ設定
          main_window = {
            position = "right",   -- REPL表示位置（right/left/top/bottom）
            size = 80             -- ウィンドウサイズ
          },
          
          -- フローティングウィンドウ設定
          floating_window = {
            border = "single",    -- ボーダースタイル
            scroll_step = 3       -- スクロールステップ
          },
          
          -- 補完設定
          cmp = { enabled = false },     -- nvim-cmp統合
          arglist = { enabled = true },  -- 引数リスト表示
          
          -- 入力履歴
          input_history_limit = 100,     -- 入力履歴の保存数
          
          -- Swankコントリビューション
          contribs = {
            "SWANK-ASDF", 
            "SWANK-PACKAGE-FU",
            "SWANK-PRESENTATIONS", 
            "SWANK-FANCY-INSPECTOR",
            "SWANK-C-P-C", 
            "SWANK-ARGLISTS",
            "SWANK-REPL", 
            "SWANK-FUZZY",
            "SWANK-MREPL",           -- 複数REPL対応
            "SWANK-TRACE-DIALOG"     -- トレース機能
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
                show = ",so",          -- REPL表示
                clear = ",sC",         -- REPL クリア
                send_atom_expr = ",ss", -- 式をREPLに送信
                send_expr = ",se",     -- S式をREPLに送信
                send_toplevel_expr = ",st", -- トップレベル式を送信
                prompt = ",si"         -- REPL入力プロンプト
              }
            }
          }
        }
        
        -- 設定が正しく読み込まれたことを確認
        vim.defer_fn(function()
          print("nvlime configured with sbcl wrapper (roswell backend)")
        end, 100)
      end
    },
}
  