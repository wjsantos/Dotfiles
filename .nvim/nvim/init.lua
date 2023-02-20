-- this setup was mostly base on this, to do a fast migration from vim to neovim:
--    https://github.com/MarioCarrion/videos/tree/269956e913b76e6bb4ed790e4b5d25255cb1db4f/2023/01/nvim
-- from this video:
--    https://www.youtube.com/watch?v=LbsILONOaiE
require("plugins.setup")

require("plugins.default")
require("plugins.persistent_undo")

require("plugins.lualine")
require("plugins.nvim-tree")
require("plugins.bufexplorer")
require("plugins.comment")
require("plugins.telescope")
require("plugins.nvim-treesitter")
require("plugins.gitsigns")
require("plugins.nvim-cmp")
require("plugins.nuuid")
