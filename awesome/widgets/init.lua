local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local helpers = require("confs.helpers")
local dpi = require("beautiful").xresources.apply_dpi

local memory = require("widgets/memory")

local widgets = {}

-- Create a promptbox for each screen
-- widgets.mypromptbox = awful.widget.prompt()

-- Create an imagebox widget which will contain an icon indicating which layout we're using.
-- We need one layoutbox per screen.

-- layoutbox (the thing that show layout options)
local layoutbox = awful.widget.layoutbox(s)
layoutbox:buttons(gears.table.join(
	awful.button({}, 1, function()
		awful.layout.inc(1)
	end),
	awful.button({}, 3, function()
		awful.layout.inc(-1)
	end),
	awful.button({}, 4, function()
		awful.layout.inc(1)
	end),
	awful.button({}, 5, function()
		awful.layout.inc(-1)
	end)
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
widgets.textclock = helpers.rounded_it(mytextclock, "#66545e")

-- memory widget
widgets.memory = helpers.rounded_it(memory, "#aa6f73", "#191919")

-- momo's widget
local love_momo = wibox.widget({
	markup = "<b>I Love Momo !</b>",
	widget = wibox.widget.textbox,
})
widgets.momo = helpers.rounded_it(love_momo, "#c79467", "#191919")

-- Chaeyoung's widget UwU
local love_chae = wibox.widget({
	markup = "<b>I Love Chaeyoung !</b>",
	widget = wibox.widget.textbox,
})
widgets.chae = helpers.rounded_it(love_chae, "#A10035", "#191919")

-- systray
local systray = wibox.widget.systray()
widgets.mysystray = wibox.widget({
	{
		{
			systray,
			top = 4,
			bottom = 4,
			left = 2,
			right = 2,
			widget = wibox.container.margin,
		},
		bg = "#FFF",
		widget = wibox.container.background,
	},
	margins = 2,
	widget = wibox.container.margin,
})

return widgets
