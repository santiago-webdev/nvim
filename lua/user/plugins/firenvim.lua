local M = {
  "glacambre/firenvim",
  build = ":call firenvim#install(0)"
}

function M.config()
  vim.g.firenvim_config = {
    globalSettings = { alt = "all" },
    localSettings = {
      [".*"] = {
        cmdline = "firenvim",
        content = "text",
        priority = 0,
        selector = "textarea",
        takeover = "never",
      },
    },
  }
end

return M
