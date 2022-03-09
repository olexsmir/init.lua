---@param opts table
return function(opts)
  require("rust-tools").setup {
    server = opts,
    tools = {
      inlay_hints = {
        parameter_hints_prefix = "<- ",
        other_hints_prefix = "=> ",
        highlight = "LspCodeLens",
      },
    },
  }
end
