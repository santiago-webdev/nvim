--- @param level integer
--- @return string
local function get_urgency(level)
  local as = vim.log.levels
  local urgency = {
    [as.TRACE] = "low", -- 0
    [as.DEBUG] = "low", -- 1
    [as.INFO] = "normal", -- 2
    [as.WARN] = "normal", -- 3
    [as.ERROR] = "critical", -- 4
  }
  return urgency[level] or "normal"
end

--- @param msg string
--- @param level integer
local function notify_send(msg, level)
  vim.system({
    "notify-send",
    "--icon",
    "nvim",
    "--urgency",
    get_urgency(level),
    "Neovim",
    msg,
  })
end

if vim.fn.executable("notify-send") == 0 then
  return vim.schedule(function()
    vim.notify("`notify-send` is not available in the host", vim.log.levels.INFO)
  end)
end

vim.notify = notify_send
