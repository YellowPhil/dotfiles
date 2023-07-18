local keymap = vim.keymap.set

keymap("n", "<leader>r", [[:TermExec cmd="clear && g++ -g -fsanitize=address -std=c++17 -Wall -Wextra -Wshadow -DONPC -O2 %:p -o %:p:r && %:p:r"<cr>]], {silent = true, buffer = true})

keymap("n", "<leader>b", [[:TermExec cmd="make"<cr>]], {silent=true, buffer=true})
