require('lint').linters_by_ft = {
  text = {'vale',},
  javascript = {'eslint',},
  typescript = {'eslint',},
  json = {'jsonlint',},
  markdown = {'vale',},
  rst = {'vale',},
  ruby = {'ruby',},
  janet = {'janet',},
  inko = {'inko',},
  clojure = {'clj-kondo',},
  dockerfile = {'hadolint',},
  terraform = {'tflint'},
}
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
--    vim.lsp.buf.format()
--    require("lint").try_lint()
  end,
})
