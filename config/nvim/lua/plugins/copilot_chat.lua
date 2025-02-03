return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    opts = {
      prompts = {
        Explain = {
          prompt = "> /COPILOT_EXPLAIN\n\nカーソル上のコードの説明を段落をつけて書いてください。",
        },
        Review = {
          prompt = "> /COPILOT_REVIEW\n\n選択されたコードをレビューしてください。",
          -- see config.lua for implementation
        },
        Fix = {
          prompt = "> /COPILOT_FIX\n\nこのコードには問題があります。バグを修正したコードに書き換えてください。",
        },
        Optimize = {
          prompt = "> /COPILOT_REFACTOR\n\n選択したコードを最適化し、パフォーマンスと可読性を向上させてください。",
        },
        Docs = {
          prompt = "> /COPILOT_REFACTOR\n\n選択したコードのドキュメントを書いてください。ドキュメントをコメントとして追加した元のコードを含むコードブロックで回答してください。使用するプログラミング言語に最も適したドキュメントスタイルを使用してください（例：JavaScriptのJSDoc、Pythonのdocstringsなど）",
        },
        Tests = {
          prompt = "> /COPILOT_TESTS\n\nカーソル上のコードの詳細な単体テスト関数を書いてください。",
        },
        Commit = {
          prompt = "> #git:staged\n\nWrite commit message for the change with commitizen convention. Make sure the title has maximum 50 characters and message is wrapped at 72 characters. Wrap the whole message in code block with language gitcommit.",
        },
      },
    },
  },
}
