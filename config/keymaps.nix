let
  normal_mode = map (key: key // {mode = "n";}) [
    {
      key = "<leader>bc";
      action = "<Cmd>BufferClose<CR>";
      options.desc = "Close (tab) buffer";
    }

    {
      key = "<leader>bn";
      action = "<Cmd>tabnew<CR>";
      options.desc = "New (tab) buffer";
    }

    {
      key = "<leader>bod";
      action = "<Cmd>BufferOrderByDirectory<CR>";
      options.desc = "By directory";
    }

    {
      key = "<leader>bol";
      action = "<Cmd>BufferOrderByLanguage<CR>";
      options.desc = "By language";
    }

    {
      key = "<leader>bon";
      action = "<Cmd>BufferOrderByBufferNumber<CR>";
      options.desc = "By number";
    }

    {
      key = "<leader>bow";
      action = "<Cmd>BufferOrderByWindowNumber<CR>";
      options.desc = "By window number";
    }

    {
      key = "<leader>qc";
      action = "<Cmd>q<CR>";
      options.desc = "Quit current";
    }

    {
      key = "<leader>qq";
      action = "<Cmd>qall!<CR>";
      options.desc = "Quit all";
    }

    {
      key = "<A-->";
      action = "<Cmd>BufferPrevious<CR>";
      options.desc = "Move to previous (left) buffer";
    }

    {
      key = "<A-=>";
      action = "<Cmd>BufferNext<CR>";
      options.desc = "Move to next (right) buffer";
    }

    {
      key = "<A-,>";
      action = "<Cmd>BufferMovePrevious<CR>";
      options.desc = "Move current buffer left";
    }

    {
      key = "<A-.>";
      action = "<Cmd>BufferMoveNext<CR>";
      options.desc = "Move current buffer right";
    }

    {
      key = "<A-0>";
      action = "<Cmd>BufferLast<CR>";
      options.desc = "Move to the last buffer";
    }

    {
      key = "<A-1>";
      action = "<Cmd>BufferGoto 1<CR>";
      options.desc = "Move to buffer 1";
    }

    {
      key = "<A-2>";
      action = "<Cmd>BufferGoto 2<CR>";
      options.desc = "Move to buffer 2";
    }

    {
      key = "<A-3>";
      action = "<Cmd>BufferGoto 3<CR>";
      options.desc = "Move to buffer 3";
    }

    {
      key = "<A-4>";
      action = "<Cmd>BufferGoto 4<CR>";
      options.desc = "Move to buffer 4";
    }

    {
      key = "<A-5>";
      action = "<Cmd>BufferGoto 5<CR>";
      options.desc = "Move to buffer 5";
    }

    {
      key = "<A-6>";
      action = "<Cmd>BufferGoto 6<CR>";
      options.desc = "Move to buffer 6";
    }

    {
      key = "<A-7>";
      action = "<Cmd>BufferGoto 7<CR>";
      options.desc = "Move to buffer 7";
    }

    {
      key = "<A-8>";
      action = "<Cmd>BufferGoto 8<CR>";
      options.desc = "Move to buffer 8";
    }

    {
      key = "<A-9>";
      action = "<Cmd>BufferGoto 9<CR>";
      options.desc = "Move to buffer 9";
    }

    {
      key = "<A-c>";
      action = "<Cmd>BufferClose<CR>";
      options.desc = "Close the buffer";
    }

    {
      key = "<A-p>";
      action = "<Cmd>BufferPin<CR>";
      options.desc = "Toggle buffer pin";
    }

    {
      key = "<C-p>";
      action = "<Cmd>BufferPick<CR>";
      options.desc = "Pick buffer";
    }

    {
      key = "<C-A>";
      action = "ggVG";
      options.desc = "Select whole file";
    }

    {
      key = "m";
      action = "<Cmd>noh<CR>";
      options.desc = "clear selection";
    }

    {
      key = "<C-S>";
      action = "<Cmd>w<CR>";
      options.desc = "Save the file";
    }

    {
      key = "<C-h>";
      action = "<Cmd>5winc ><CR>";
      options.desc = "Resize split left by 5u";
    }

    {
      key = "<C-j>";
      action = "<Cmd>5winc +<CR>";
      options.desc = "Resize split down by 5u";
    }

    {
      key = "<C-k>";
      action = "<Cmd>5winc -<CR>";
      options.desc = "Resize split up by 5u";
    }

    {
      key = "<C-l>";
      action = "<Cmd>5winc <<CR>";
      options.desc = "Resize split right by 5u";
    }

    {
      key = "<M-Left>";
      action = "^";
      options.desc = "Go to line start";
    }

    {
      key = "<M-Right>";
      action = "$";
      options.desc = "Go to line end";
    }

    {
      key = "<M-h>";
      action = "<Cmd>wincmd h<CR>";
      options.desc = "Move to split left";
    }

    {
      key = "<M-j>";
      action = "<Cmd>wincmd j<CR>";
      options.desc = "Move to split down";
    }

    {
      key = "<M-k>";
      action = "<Cmd>wincmd k<CR>";
      options.desc = "Move to split up";
    }

    {
      key = "<M-l>";
      action = "<Cmd>wincmd l<CR>";
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
      key = "<C-S>";
      action = "<Esc><Cmd>w<CR>a";
      options.desc = "Save the file";
    }

    {
      key = "<M-Left>";
      action = "<C-O>^";
      options.desc = "Go to line start";
    }

    {
      key = "<M-Right>";
      action = "<C-O>$";
      options.desc = "Go to line end";
    }

    {
      key = "<M-h>";
      action = "<Esc><Cmd>wincmd h<CR>";
      options.desc = "Move to split left";
    }

    {
      key = "<M-j>";
      action = "<Esc><Cmd>wincmd j<CR>";
      options.desc = "Move to split down";
    }

    {
      key = "<M-k>";
      action = "<Esc><Cmd>wincmd k<CR>";
      options.desc = "Move to split up";
    }

    {
      key = "<M-l>";
      action = "<Esc><Cmd>wincmd l<CR>";
      options.desc = "Move to split right";
    }
  ];
in {keymaps = normal_mode ++ insert_mode;}
