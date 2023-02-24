-- Let’s configure the nvim-treesitter plugin to use the markdown parser 
-- for mdx filetypes:

-- MDX Treesitter Config
-- https://phelipetls.github.io/posts/mdx-syntax-highlight-treesitter-nvim/
local ft_to_parser = require("nvim-treesitter.parsers").filetype_to_parsername
ft_to_parser.mdx = "markdown"
