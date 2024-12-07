{ helpers, pkgs, ... }:

{
  opts = { enable = true; };

  rootOpts = {
    extraPackages = [ pkgs.ripgrep ];

    colorschemes.catppuccin.settings.integrations.telescope.enabled = true;

    extraConfigLuaPre = ''
      local TelescopeWithTheme = function(fn, args, extension)
        args.layout_config = {
          anchor = "N",
          mirror = true,
          width = 0.8,
        }

        if fn == "keymaps" or fn == "registers" then args.layout_config.height = function(_, _, max_lines) return max_lines end end

        local args_with_theme = require("telescope.themes").get_dropdown(args)

        if extension ~= "" then
          require("telescope").extensions[extension][fn](args_with_theme)
        else
          require("telescope.builtin")[fn](args_with_theme)
        end
      end
    '';

    # I don't really understand this, stole it from https://github.com/nicolas-goudry/nixvim-config/
    keymaps = let
      mkTelescopeKeymap = { key, fn, args ? { __empty = true; }, desc ? ""
        , extension ? null, mode ? "n" }: {
          inherit key mode;

          action.__raw = "function() TelescopeWithTheme('${fn}', ${
              helpers.toLuaObject args
            }, '${builtins.toString extension}') end";
          options = { inherit desc; };
        };
    in map mkTelescopeKeymap [
      {
        desc = "Resume previous search";
        key = "<leader>g<cr>";
        fn = "resume";
      }

      {
        desc = "Find words in current buffer";
        key = "<leader>g/";
        fn = "current_buffer_fuzzy_find";
      }

      {
        desc = "Find buffers";
        key = "<leader>gb";
        fn = "buffers";
      }

      {
        desc = "Find files";
        key = "<leader>gf";
        fn = "find_files";
      }

      {
        desc = "Find all files";
        key = "<leader>gF";
        fn = "find_files";
        args = {
          hidden = true;
          no_ignore = true;
        };
      }

      {
        desc = "Find words";
        key = "<leader>gr";
        fn = "live_grep";
      }

      {
        desc = "Find help tags";
        key = "<leader>gh";
        fn = "help_tags";
      }

      {
        desc = "Find keymaps";
        key = "<leader>gk";
        fn = "keymaps";
      }

      {
        desc = "Find history";
        key = "<leader>go";
        fn = "oldfiles";
      }

      {
        desc = "Find registers";
        key = "<leader>g`";
        fn = "registers";
      }

      {
        desc = "Find word under cursor";
        key = "<leader>gw";
        fn = "grep_string";
      }

      {
        desc = "Search references";
        key = "<leader>cr";
        fn = "lsp_references";
      }
    ];
  };
}
