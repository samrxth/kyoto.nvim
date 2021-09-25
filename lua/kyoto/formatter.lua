local function prettier()
  -- npm install -g prettier
  -- npm install -g @fsouza/prettierd
  return {
    exe = "prettier",
    args = {
      vim.api.nvim_buf_get_name(0)
    },
    stdin = true
  }
end

local function gofmt()
  return {
    exe = "gofmt",
    args = {vim.api.nvim_buf_get_name(0)},
    stdin = true
  }
end

local function clang_format()
  return {
    exe = "clang-format",
    args = {vim.api.nvim_buf_get_name(0)},
    stdin = true
  }
end

require "formatter".setup {
  logging = true,
  filetype = {
    c = {clang_format},
    cpp = {clang_format},
    css = {prettier},
    html = {prettier},
    javascript = {prettier},
    javascriptreact = {prettier},
    go = {gofmt},
    typescript = {prettier},
    typescriptreact = {prettier}
  }
}

