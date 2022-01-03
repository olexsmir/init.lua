local u = require "utils"

u.nmap("<leader>ov", "<cmd>lua require('crates').show_versions_popup()<cr>")
u.nmap("<leader>of", "<cmd>lua require('crates').show_features_popup()<cr>")
u.nmap("<leader>ou", "<cmd>lua require('crates').update_crate()<cr>")
u.nmap("<leader>oU", "<cmd>lua require('crates').update_all_crates()<cr>")
