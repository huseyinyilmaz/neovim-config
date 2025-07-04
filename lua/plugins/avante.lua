return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  version = false, -- set this if you want to always pull the latest change
  opts = {
    -- provider = "openai",
    provider = "gemini",
    providers = {
      gemini = {
        -- @see https://ai.google.dev/gemini-api/docs/models/gemini
        model ="gemini-2.0-flash",	
        -- model = "gemini-1.5-pro",
        temperature = 0,
        max_tokens = 4096,
      },
      -- Open ai config
      -- openai = {
      --   model = "gpt-4o-mini",
      -- },
      --
      --
      --
      --
      -- Deepseek config
      openai = {
        endpoint = "https://api.deepseek.com/v1",
        model = "deepseek-chat",
        timeout = 30000,     -- Timeout in milliseconds
        -- optional
        api_key_name = "DEEPSEEK_API_KEY",     -- default OPENAI_API_KEY if not set
        extra_request_body = {
          temperature = 0,
          max_tokens = 4096,
        }
      },

      ollama = {
        -- ["local"] = true,
        api_key_name = '',
        endpoint = "127.0.0.1:11434/v1",
        -- model = "codegemma",
        -- model = "llama3.1:latest",
        model = "qwen2.5-coder:latest",
        parse_curl_args = function(opts, code_opts)
          return {
            url = opts.endpoint .. "/chat/completions",
            headers = {
              ["Accept"] = "application/json",
              ["Content-Type"] = "application/json",
            },
            body = {
              model = opts.model,
              messages = require("avante.providers").copilot.parse_messages(code_opts), -- you can make your own message, but this is very advanced
              max_tokens = 2048,
              stream = true,
            },
          }
        end,
        parse_response_data = function(data_stream, event_state, opts)
          require("avante.providers").openai.parse_response(data_stream, event_state, opts)
        end,
      },

      
    }
    -- provider = "ollama",
    -- provider = "deepseek",
  },
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  build = "make",
  -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  dependencies = {
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "hrsh7th/nvim-cmp",            -- autocompletion for avante commands and mentions
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    "zbirenbaum/copilot.lua",      -- for providers='copilot'
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}
