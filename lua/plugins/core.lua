---@type LazySpec
return {
  "nvim-lua/plenary.nvim",
  "kyazdani42/nvim-web-devicons",
  { "tpope/vim-surround", keys = { "c", "d", "y" } },
  { "tpope/vim-repeat", event = "VeryLazy" },
  { "tpope/vim-speeddating", keys = { "<C-a>", "<C-x>" } },
  { "tweekmonster/helpful.vim", cmd = "HelpfulVersion" },
  { "wakatime/vim-wakatime", event = "VeryLazy" },
  { "pmizio/typescript-tools.nvim", ft = { "typescript" }, config = true },
  { "OXY2DEV/markview.nvim", ft = { "markdown" }, version = false },
  {
    "folke/tokyonight.nvim",
    opts = { style = "night" },
    init = function()
      vim.cmd.colorscheme "tokyonight"
    end,
  },
  {
    "oysandvik94/curl.nvim",
    version = false,
    dev = true,
    cmd = { "CurlOpen", "CurlCollection" },
    ---@module "curl"
    ---@type curl_config
    ---@diagnostic disable-next-line: missing-fields
    opts = {
      default_flags = { "-i" },
      open_with = "vsplit",
    },
  },
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup {}
      require("telescope").load_extension "todo-comments"
    end,
  },
  {
    "3rd/image.nvim",
    version = false,
    ft = { "markdown" },
    opts = {
      max_height_window_percentage = 65,
      integrations = {
        markdown = {
          only_render_image_at_cursor = true,
          clear_in_insert_mode = true,
          -- TODO: refactor me daddy
          resolve_image_path = function(document_path, image_path, fallback)
            if document_path:find(vim.env.OBI_PATH) then
              if image_path:match "^[x/]" then
                return vim.fs.joinpath(vim.env.OBI_PATH, image_path)
              end

              return vim.fs.joinpath(vim.env.OBI_PATH, "assets", image_path)
            end

            return fallback(document_path, image_path)
          end,
        },
      },
    },
  },
}
