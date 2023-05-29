pcall(require, "luarocks.loader")
require("awful.autofocus")

local theme = require("themes.twice.theme")
local beautiful = require("beautiful")
beautiful.init(theme)
-- beautiful.init("~/.config/awesome/themes/twice/theme.lua")

require("awful.hotkeys_popup.keys")

require("errors.handling")

require("confs")

require("rules")

require("ui")

-- solving blurry effect with some icons (e.g. firefox)
awesome.set_preferred_icon_size(32)

collectgarbage("setpause", 110)
collectgarbage("setstepmul", 1000)
