local autocmds = {
    terminal = {
        {"TermOpen", "*", "setlocal nonumber norelativenumber | startinsert"}
    },
    lua = {{"BufWrite", "*.lua", "call LuaFormat()"}}
}

nvim_create_augroups(autocmds)
