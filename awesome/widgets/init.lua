local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local helpers = require("confs.helpers")
local dpi = require("beautiful").xresources.apply_dpi

local memory = require("widgets.memory")
local cpu_usage = require("widgets.cpu_usage")
local cpu_temperature = require("widgets.cpu_temp")

local widgets = {}

-- Create an imagebox widget which will contain an icon indicating which layout we're using.
-- We need one layoutbox per screen.

-- layoutbox (the thing that show layout options)
local layoutbox = awful.widget.layoutbox()

layoutbox:buttons(gears.table.join(
	awful.button({}, 1, function() awful.layout.inc(1) end),
	awful.button({}, 3, function() awful.layout.inc(-1) end),
	awful.button({}, 4, function() awful.layout.inc(1) end),
	awful.button({}, 5, function() awful.layout.inc(-1) end)
))

widgets.layouts = {
	layoutbox,
	top = 6,
	bottom = 6,
	right = 10,
	left = 5,
	widget = wibox.container.margin,
}

-- Keyboard map indicator and switcher
local mykeyboardlayout = awful.widget.keyboardlayout()
widgets.keyboardlayout = mykeyboardlayout

-- Create a textclock widget
local mytextclock = wibox.widget.textclock()
widgets.textclock = helpers.rounded_it(
	mytextclock, Colors.lavender, Colors.crust, 2, 2
)

-- memory widget
widgets.memory = helpers.rounded_it(wibox.widget {
	memory.icon,
	wibox.widget {
		memory.widget,
		widget = wibox.container.background
	},
	layout = wibox.layout.fixed.horizontal
}, Colors.sky, Colors.crust, 2, 2)

widgets.cpu_usage = helpers.rounded_it(wibox.widget {
	cpu_usage.icon,
	wibox.widget {
		cpu_usage.widget,
		widget = wibox.container.background
	},
	layout = wibox.layout.fixed.horizontal
}, Colors.red, Colors.crust, 6, 2)

widgets.cpu_temperature = helpers.rounded_it(wibox.widget {
	cpu_temperature.icon,
	wibox.widget {
		cpu_temperature.widget,
		widget = wibox.container.background
	},
	layout = wibox.layout.fixed.horizontal
}, "#fab387", "#191919", 2, 2)

-- widgets.cpu_temperature = helpers.rounded_it(cpu_temperature, , "#191919")

-- momo's widget
local love_momo = wibox.widget({
	markup = "<b>I Love Momo !</b>",
	widget = wibox.widget.textbox,
})
widgets.momo = helpers.rounded_it(love_momo, "#a6e3a1", "#191919", 2, 2)

-- Chaeyoung's widget UwU
local love_chae = wibox.widget({
	markup = "<b>I Love Chaeyoung !</b>",
	widget = wibox.widget.textbox,
})
widgets.chae = helpers.rounded_it(love_chae, "#FFF", "#191919", 2, 2)

-- systray
local systray = wibox.widget.systray()
widgets.systray = helpers.rounded_it(
	systray, Colors.overlay1, "", 2, 2
)

local layout_box = awful.widget.layoutbox()
widgets.layout_box = helpers.rounded_it(
	layout_box, Colors.surface2, "", 2, 6
)

return widgets
