return {
  'nvimdev/guard.nvim',
  event = { 'BufReadPre' },
  config = function()
    local ft = require('guard.filetype')
    local formatter = require('guard.tools.formatter')
    local guard = require('guard')

    ft('lua'):fmt(formatter.stylua)
    ft('typescript,javascript,typescriptreact'):fmt('prettier')

    guard.setup({
      fmt_on_save = true,
      lsp_as_default_formatter = false,
    })
  end,
}
