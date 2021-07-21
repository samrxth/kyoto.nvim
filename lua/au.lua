local autocmds = {
    terminal = {
        {"TermOpen", "*", "setlocal nonumber norelativenumber | startinsert"}
    }
}

nvim_create_augroups(autocmds)
