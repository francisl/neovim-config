vim.api.nvim_create_user_command("SmartClose", function()
  local current_win = vim.api.nvim_get_current_win()
  local current_buf = vim.api.nvim_get_current_buf()
  
  -- Try to get the alternate buffer (#)
  local alt_bufnr = vim.fn.bufnr("#")
  
  -- If alternate buffer exists and is valid, use it
  if alt_bufnr ~= -1 and vim.api.nvim_buf_is_valid(alt_bufnr) and vim.fn.buflisted(alt_bufnr) == 1 then
    vim.api.nvim_win_set_buf(current_win, alt_bufnr)
  else
    -- Otherwise, find another buffer
    local buffers = vim.fn.getbufinfo({buflisted = 1})
    local alternative_buf = nil
    
    -- Find an alternative buffer
    for _, buf in ipairs(buffers) do
      if buf.bufnr ~= current_buf then
        alternative_buf = buf.bufnr
        break
      end
    end
    
    -- If no alternative buffer exists, create a new one
    if not alternative_buf then
      vim.cmd("enew")
    else
      -- Switch the window to the alternative buffer
      vim.api.nvim_win_set_buf(current_win, alternative_buf)
    end
  end
  
  -- Now delete the original buffer
  vim.cmd("bwipeout " .. current_buf)
end, {})
