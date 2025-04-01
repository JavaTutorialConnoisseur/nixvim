{
  helpers,
  pkgs,
  ...
}: {
  opts = {enable = true;};

  rootOpts = {
    extraPackages = [pkgs.ripgrep];

    colorschemes.catppuccin.settings.integrations.telescope.enabled = true;
    plugins.transparent.settings.extra_groups = [
      "TelescopeNormal"
      "TelescopeBorder"
      "TelescopePreviewNormal"
      "TelescopePreviewBorder"
      "TelescopePromptNormal"
      "TelescopePromptBorder"
      "TelescopeResultsNormal"
      "TelescopeResultsBorder"
    ];

    plugins.which-key.settings.spec = [
      {
        __unkeyed-1 = "<leader>g";
        group = "Searching";
        icon = {
          icon = " ";
          color = "green";
        };
      }
    ];

    extraConfigLuaPre = ''
      local TelescopeWithTheme = function(fn, args, extension)
        args.layout_config = {
          anchor = "N",
          mirror = true,
          width = 0.8,
        }

        if fn == "keymaps" or fn == "registers" then
          args.layout_config.height = function(_, _, max_lines)
            return max_lines
          end
        end

        local args_with_theme = require("telescope.themes").get_dropdown(args)

        if extension ~= "" then
          require("telescope").extensions[extension][fn](args_with_theme)
        else
          require("telescope.builtin")[fn](args_with_theme)
        end
      end
    '';

    keymaps = let
      mkTelescopeKeymap = {
        key,
        fn,
        args ? {__empty = true;},
        desc ? "",
        extension ? null,
        mode ? "n",
      }: {
        inherit key mode;

        action.__raw = "function() TelescopeWithTheme('${fn}', ${
          helpers.toLuaObject args
        }, '${builtins.toString extension}') end";
        options = {inherit desc;};
      };
    in
      map mkTelescopeKeymap [
        {
          desc = "Resume previous search";
          key = "<leader>g<cr>";
          fn = "resume";
        }

        {
          desc = "Words in current buffer";
          key = "<leader>g/";
          fn = "current_buffer_fuzzy_find";
        }

        {
          desc = "Buffers";
          key = "<leader>gb";
          fn = "buffers";
        }

        {
          desc = "Files";
          key = "<leader>gf";
          fn = "find_files";
        }

        {
          desc = "Visualize undotree";
          key = "<leader>gu";
          fn = "undo";
        }

        {
          desc = "Marx";
          key = "<leader>gm";
          fn = "marks";
        }

        {
          desc = "All files";
          key = "<leader>gF";
          fn = "find_files";
          args = {
            hidden = true;
            no_ignore = true;
          };
        }

        {
          desc = "Words";
          key = "<leader>gr";
          fn = "live_grep";
        }

        {
          desc = "Words in all files";
          key = "<leader>gR";
          fn = "live_grep";
          args = {
            glob_pattern = "*";
          };
        }

        {
          desc = "Help tags";
          key = "<leader>gh";
          fn = "help_tags";
        }

        {
          desc = "Keymaps";
          key = "<leader>gk";
          fn = "keymaps";
        }

        {
          desc = "History";
          key = "<leader>go";
          fn = "oldfiles";
        }

        {
          desc = "Registers";
          key = "<leader>g`";
          fn = "registers";
        }

        {
          desc = "Word under cursor";
          key = "<leader>gw";
          fn = "grep_string";
        }

        {
          desc = "References";
          key = "<leader>cr";
          fn = "lsp_references";
        }

        {
          desc = "List all diagnostics";
          key = "<leader>dl";
          fn = "diagnostics";
        }
      ];
  };
}
