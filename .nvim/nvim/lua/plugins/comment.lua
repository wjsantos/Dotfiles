local setup, comment = pcall(require, "Comment")
if not setup then return end

-- VISUAL MODE BINDINGS
-- `gc` - Toggles the region using linewise comment
-- `gb` - Toggles the region using blockwise comment
comment.setup()
