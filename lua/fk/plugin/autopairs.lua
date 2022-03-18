local npairs = require "nvim-autopairs"

npairs.setup { check_ts = true }
npairs.add_rules(require "nvim-autopairs.rules.endwise-lua")
