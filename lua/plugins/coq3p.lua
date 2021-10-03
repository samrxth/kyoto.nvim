require("coq_3p")({
  { src = "nvimlua", short_name = "nLUA" },
  { src = "vimtex", short_name = "vTEX" },
  { src = "demo" },
  {
    src = "repl",
    sh = "zsh",
    shell = { p = "python", n = "node" },
    max_lines = 99,
    deadline = 500,
    unsafe = { "rm", "poweroff", "mv", "trash", "kill" },
  },
  { src = "bc", short_name = "MATH", precision = 6 },
})
