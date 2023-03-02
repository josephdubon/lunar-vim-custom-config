-- Parser for zsh files
-- https://github.com/nvim-treesitter/nvim-treesitter/issues/655#issuecomment-1021160477

local ft_to_lang = require('nvim-treesitter.parsers').ft_to_lang
require('nvim-treesitter.parsers').ft_to_lang = function(ft)
    if ft == 'zsh' then
        return 'bash'
    end
    return ft_to_lang(ft)
end
