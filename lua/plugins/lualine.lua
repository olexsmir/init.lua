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
  harpoon_status = {
    function()
      local list = require("harpoon"):list()
      local rdir = list.config:get_root_dir()
      local cfpath = vim.api.nvim_buf_get_name(0)
      local status = {}
      for i = 1, list:length() do
        local value = list:get(i).value:gsub("^%./", "")
        if cfpath == rdir .. "/" .. value then
          table.insert(status, string.format("]%d[", i))
        else
          table.insert(status, i)
        end
      end

      return table.concat(status, " "):reverse()
    end,
  },
}

---@type LazySpec
return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = {
    options = {
      theme = "auto",
      globalstatus = true,
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = {
        "NvimTree",
        "TelescopePrompt",
        "NeogitStatus",
        "harpoon",
        "lazy",
      },
    },
    sections = {
      lualine_a = { c.mode },
      lualine_b = {},
      lualine_c = { c.harpoon_status, "filename", "branch", c.diagnostic },
      lualine_x = { c.lsp, "diff" },
      lualine_y = {},
      lualine_z = { c.location },
    },
  },
}
