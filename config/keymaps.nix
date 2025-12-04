_: let
  normal_mode = map (key: key // {mode = "n";}) [
    {
      key = "<leader>F";
      action = ''
        <cmd>lua vim.schedule(function() vim.cmd("silent! loadview") end)<cr>'';
      options.desc = "Refresh loadview";
    }

    {
      key = "<leader>;";
      action = "<esc>mp$a;<esc>`p";
      options.desc = "Add semicolon at EOL";
    }

    {
      key = "<leader>bc";
      action = "<cmd>BufferClose<cr>";
      options.desc = "Close (tab) buffer";
    }

    {
      key = "<leader>bn";
      action = "<cmd>tabnew<cr>";
      options.desc = "New (tab) buffer";
    }

    {
      mode = "n";
      key = "<leader>bb";
      options.desc = "Open bug report file";
      action = "<cmd>e /home/parrycat/Documents/projects/random/nixvim/BUGS.md<cr>";
    }

    {
      key = "<leader>bod";
      action = "<cmd>BufferOrderByDirectory<cr>";
      options.desc = "By directory";
    }

    {
      key = "<leader>bol";
      action = "<cmd>BufferOrderByLanguage<cr>";
      options.desc = "By language";
    }

    {
      key = "<leader>bon";
      action = "<cmd>BufferOrderByBufferNumber<cr>";
      options.desc = "By number";
    }

    {
      key = "<leader>bow";
      action = "<cmd>BufferOrderByWindowNumber<cr>";
      options.desc = "By window number";
    }

    {
      key = "<leader>qq";
      action = "<cmd>qall!<cr>";
      options.desc = "Quit all";
    }

    {
      key = "<m-`>";
      action = "<cmd>b#<cr>";
      options.desc = "Go to alternate buffer";
    }

    {
      key = "<m-->";
      action = "<cmd>BufferPrevious<cr>";
      options.desc = "Move to previous (left) buffer";
    }

    {
      key = "<m-=>";
      action = "<cmd>BufferNext<cr>";
      options.desc = "Move to next (right) buffer";
    }

    {
      key = "<m-,>";
      action = "<cmd>BufferMovePrevious<cr>";
      options.desc = "Move current buffer left";
    }

    {
      key = "<m-.>";
      action = "<cmd>BufferMoveNext<cr>";
      options.desc = "Move current buffer right";
    }

    {
      key = "<m-0>";
      action = "<cmd>BufferLast<cr>";
      options.desc = "Move to the last buffer";
    }

    {
      key = "<m-1>";
      action = "<cmd>BufferGoto 1<cr>";
      options.desc = "Move to buffer 1";
    }

    {
      key = "<m-2>";
      action = "<cmd>BufferGoto 2<cr>";
      options.desc = "Move to buffer 2";
    }

    {
      key = "<m-3>";
      action = "<cmd>BufferGoto 3<cr>";
      options.desc = "Move to buffer 3";
    }

    {
      key = "<m-4>";
      action = "<cmd>BufferGoto 4<cr>";
      options.desc = "Move to buffer 4";
    }

    {
      key = "<m-5>";
      action = "<cmd>BufferGoto 5<cr>";
      options.desc = "Move to buffer 5";
    }

    {
      key = "<m-6>";
      action = "<cmd>BufferGoto 6<cr>";
      options.desc = "Move to buffer 6";
    }

    {
      key = "<m-7>";
      action = "<cmd>BufferGoto 7<cr>";
      options.desc = "Move to buffer 7";
    }

    {
      key = "<m-8>";
      action = "<cmd>BufferGoto 8<cr>";
      options.desc = "Move to buffer 8";
    }

    {
      key = "<m-9>";
      action = "<cmd>BufferGoto 9<cr>";
      options.desc = "Move to buffer 9";
    }

    {
      key = "<m-c>";
      action = "<cmd>BufferClose<cr>";
      options.desc = "Close the buffer";
    }

    {
      key = "<m-p>";
      action = "<cmd>BufferPin<cr>";
      options.desc = "Toggle buffer pin";
    }

    {
      key = "<c-a>";
      action = "ggVG";
      options.desc = "Select whole file";
    }

    {
      key = "<leader>M";
      action = "<cmd>noh<cr>";
      options.desc = "clear selection";
    }

    {
      key = "<c-s>";
      action = "<cmd>w<cr>";
      options.desc = "Save the file";
    }

    {
      key = "<c-h>";
      action = "<cmd>5winc ><cr>";
      options.desc = "Resize split left by 5u";
    }

    {
      key = "<c-j>";
      action = "<cmd>5winc +<cr>";
      options.desc = "Resize split down by 5u";
    }

    {
      key = "<c-k>";
      action = "<cmd>5winc -<cr>";
      options.desc = "Resize split up by 5u";
    }

    {
      key = "<c-l>";
      action = "<cmd>5winc <<cr>";
      options.desc = "Resize split right by 5u";
    }

    {
      key = "<m-left>";
      action = "^";
      options.desc = "Go to line start";
    }

    {
      key = "<m-right>";
      action = "$";
      options.desc = "Go to line end";
    }

    {
      key = "<m-h>";
      action = "<cmd>wincmd h<cr>";
      options.desc = "Move to split left";
    }

    {
      key = "<m-j>";
      action = "<cmd>wincmd j<cr>";
      options.desc = "Move to split down";
    }

    {
      key = "<m-k>";
      action = "<cmd>wincmd k<cr>";
      options.desc = "Move to split up";
    }

    {
      key = "<m-l>";
      action = "<cmd>wincmd l<cr>";
      options.desc = "Move to split right";
    }

    {
      key = "<leader>tr";
      action = "<cmd>RemoveTrailingWhitespace<cr>";
      options.desc = "Remove trailing whitespace";
    }
  ];

  insert_mode = map (key: key // {mode = "i";}) [
    {
      key = "<c-s>";
      action = "<esc><cmd>w<cr>a";
      options.desc = "Save the file";
    }

    {
      key = "<m-left>";
      action = "<c-o>^";
      options.desc = "Go to line start";
    }

    {
      key = "<m-right>";
      action = "<c-o>$";
      options.desc = "Go to line end";
    }

    {
      key = "<m-h>";
      action = "<esc><cmd>wincmd h<cr>";
      options.desc = "Move to split left";
    }

    {
      key = "<m-j>";
      action = "<esc><cmd>wincmd j<cr>";
      options.desc = "Move to split down";
    }

    {
      key = "<m-k>";
      action = "<esc><cmd>wincmd k<cr>";
      options.desc = "Move to split up";
    }

    {
      key = "<m-l>";
      action = "<esc><cmd>wincmd l<cr>";
      options.desc = "Move to split right";
    }
  ];
in {keymaps = normal_mode ++ insert_mode;}
