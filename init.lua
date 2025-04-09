local function safe_require(module)
  local ok, result = pcall(require, module)
  if not ok then
    vim.schedule(function()
      vim.notify(
        "Error loading module: " .. module .. "\n" .. result,
        vim.log.levels.ERROR,
        { title = "Neovim Config Error" }
      )
    end)
    return false
  end
  return result
end

-- Core modules
safe_require("core.options")
safe_require("core.plugins")
safe_require("core.keymaps")
safe_require("core.cmds")