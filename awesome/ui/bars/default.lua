local beautiful = require("beautiful")

local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local helpers = require("confs.helpers")
local tasklist = require("ui.bars.tasklist")
local taglist = require("ui.bars.taglist")

local launcher = require("ui.menu").launcher

local widgets = require("widgets")

local function set_wallpaper(s)
	-- Wallpaper
	if beautiful.wallpaper then
		local wallpaper = beautiful.wallpaper
		-- If wallpaper is a function, call it with the screen
		if type(wallpaper) == "function" then
			wallpaper = wallpaper(s)
		end
		gears.wallpaper.maximized(wallpaper, s, false)
	end
end

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
left_widgets.spacing = 1

local left_container = wibox.container.background(left_widgets, "#11111b")

-- local right_container_background = wibox.container.background(right_widgets, Colors.base)
-- local right_container_margin = wibox.container.margin(
-- 	right_container_background, 2, 2, 2, 2
-- )

local right_container = helpers.round_container(right_widgets, Colors.base, 2, 2, 2, 2)

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
-- screen.connect_signal("property::geometry", set_wallpaper)
awful.screen.connect_for_each_screen(function(s)
	set_wallpaper(s)

	-- Each screen has its own tag table.
	awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])

	s.taglist = taglist(s)
	s.tasklist = tasklist(s)

	-- Create the wibox
	s.wibox = awful.wibar({
		position = "top",
		type = "dock",
		screen = s,
		width = s.geometry.width,
		height = dpi(40),
		bg = "#FFF00",
	})

	left_widgets:add(launcher, taglist(s))

	local middle_widgets = wibox.layout.align.horizontal(tasklist(s))
	local middle_container = wibox.container.background(middle_widgets, "#FFF")


	-- Add widgets to the wibox
	s.wibox:setup({
		layout = wibox.layout.align.horizontal,
		expand = "none",
		left_container,
		middle_container,
		right_container,
	})
end)
