return {
"goolord/alpha-nvim",
opts = function(_, opts)
        local logo = [[ 
 _______ _______  ______ ______ _     _ __   _
 |  |  | |_____| |_____/  ____/ |     | | \  |
 |  |  | |     | |    \_ /_____ |_____| |  \_|

  __   _ _______  _____  _    _ _____ _______
 | \  | |______ |     |  \  /    |   |  |  |
 |  \_| |______ |_____|   \/   __|__ |  |  |

        ]]
        opts.section.header.val = vim.split(logo, "\n", {trimempty = true})
end,
}
