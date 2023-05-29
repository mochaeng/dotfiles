local awful = require("awful")
local wibox = require("wibox")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local helpers = require("confs.helpers")
local tasklist = require("ui.bars.tasklist")
local taglist = require("ui.bars.taglist")
local launcher = require("ui.menu").launcher
local widgets = require("widgets")

local right_widgets = wibox.layout.fixed.horizontal()
right_widgets:add(
    widgets.cpu_usage,
    widgets.memory,
    widgets.cpu_temperature,
    widgets.momo,
    widgets.textclock,
    widgets.systray,
    widgets.layout_box
)

local left_widgets = wibox.layout.fixed.horizontal()
left_widgets:add(launcher)

local left_container = helpers.round_container(left_widgets, Colors.crust, 8, 0, 3, 3)
local right_container = helpers.round_container(right_widgets, Colors.crust, 0, 8, 3, 3)

awful.screen.connect_for_each_screen(function(s)
    helpers.set_wallpaper(s)

    awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])

    s.taglist = helpers.rounded_it(taglist(s), Colors.base, "", 10, 10)
    s.tasklist = helpers.rounded_it(tasklist(s), Colors.base, "", 10, 10)

    s.wibox = awful.wibar({
        position = "top",
        type = "dock",
        screen = s,
        width = s.geometry.width,
        height = dpi(40),
        bg = "#FFF00",
    })

    left_widgets:add(taglist(s))

    local middle_widgets = wibox.layout.align.horizontal(tasklist(s))
    middle_widgets = wibox.container.background(middle_widgets, "#FFF00")

    local middle_container = helpers.round_container(middle_widgets, "#FFF", 0, 0, 2, 2)

    s.wibox:setup({
        layout = wibox.layout.align.horizontal,
        expand = "none",
        left_container,
        middle_container,
        right_container,
    })
end)
