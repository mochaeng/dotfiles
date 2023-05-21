-- Standard awesome library
pcall(require, "luarocks.loader")
require("awful.autofocus")
local awful = require("awful")

-- Theme handling library
local theme = require("themes.twice.theme")
local beautiful = require("beautiful")
beautiful.init(theme)

-- Notification library
local menubar = require("menubar")
menubar.utils.terminal = terminal -- Set the terminal for applications that require it

-- local hotkeys_popup = require("awful.hotkeys_popup")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

require("errors.handling")

-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
beautiful.init("~/.config/awesome/themes/twice/theme.lua")

require("confs")

-- Menubar configuration
require("rules")

require("ui")

-- solving blurry effect with some icons (e.g. firefox)
awesome.set_preferred_icon_size(32)

collectgarbage("setpause", 110)
collectgarbage("setstepmul", 1000)
