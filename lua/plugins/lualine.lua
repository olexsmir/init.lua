local c = {
  mode = {
    function()
      return " "
    end,
    padding = 0,
  },
  diagnostic = { "diagnostics", sources = { "nvim_diagnostic" } },
  location = { "location", padding = 1, colored = false },
  lsp = {
    function()
      local clients = vim.lsp.get_clients { bufnr = 0 }
      local client_names = {}
      for _, client in pairs(clients) do
        if client.name ~= "null-ls" then
          table.insert(client_names, client.name)
        end
      end

      local client_names_str = table.concat(client_names, ", ")
      if #client_names_str == 0 then
        return ""
      else
        return "[" .. client_names_str .. "]"
      end
    end,
  },
}

return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy";
  opts = {
    options = {
      theme = "tokyonight",
      globalstatus = true,
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = {
        "NvimTree",
        "TelescopePrompt",
        "NeogitStatus",
        "lazy",
      },
    },
    sections = {
      lualine_a = { c.mode },
      lualine_b = {},
      lualine_c = { "filename", "branch", c.diagnostic },
      lualine_x = { c.lsp, "diff" },
      lualine_y = {},
      lualine_z = { c.location },
    },
  },
}
