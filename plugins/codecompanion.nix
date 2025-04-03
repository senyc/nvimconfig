let
  utils = import ../utils.nix;
in {
  plugins.codecompanion = {
    enable = true;
    settings = {
      adapters = {
        ollama = {
          __raw = ''
            function()
              return require('codecompanion.adapters').extend('ollama', {
                  env = {
                      url = "http://127.0.0.1:11434",
                  },
                  schema = {
                      model = {
                          default = "gemma3:12b",
                      },
                      num_ctx = {
                          default = 32768,
                      },
                  },
              })
            end
          '';
        };
      };
      opts = {
        log_level = "TRACE";
        send_code = true;
        use_default_actions = true;
        use_default_prompts = true;
      };
      strategies = {
        agent = {
          adapter = "ollama";
        };
        chat = {
          adapter = "ollama";
        };
        inline = {
          adapter = "ollama";
        };
      };
    };
  };
  keymaps = utils.defaultMap [
    {
      action = "<cmd>CodeCompanionChat Toggle<cr>";
      key = "<leader>ch";
      desc = "chat open";
    }
  ];
}
