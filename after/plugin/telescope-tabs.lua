local telescopetabs = require('telescope-tabs')
telescopetabs.setup {
  entry_formatter = function(tab_id, buffer_ids, file_names, file_paths, is_current)
    local tab_name = require("tabby.feature.tab_name").get(tab_id)
    return string.format("%d: %s%s", tab_id, tab_name, is_current and " <" or "")
  end,
  entry_ordinal = function(tab_id, buffer_ids, file_names, file_paths, is_current)
    return require("tabby.feature.tab_name").get(tab_id)
  end
}
vim.keymap.set('n', '<tab>', function() telescopetabs.go_to_previous() end)

