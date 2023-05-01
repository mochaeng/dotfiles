local beautiful = require("beautiful")
local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local tasklist = require("ui.bars.tasklist")
local taglist = require("ui.bars.taglist")
local launcher = require("ui.menu")

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
		position = "bottom",
		type = "dock",
		screen = s,
		width = s.geometry.width,
		height = dpi(40),
		bg = "#1e1e2e",
	})

	local left_side = wibox.layout.fixed.horizontal()
	left_side:add(launcher, taglist(s))
	left_side.spacing = 1

	local middle_side = wibox.layout.align.horizontal(tasklist(s))

	local right_side = wibox.layout.fixed.horizontal()
	right_side:add(
		widgets.textclock,
		widgets.momo,
		widgets.memory,
		widgets.cpu_usage,
		widgets.cpu_temperature,
		widgets.mysystray
	)

	-- Add widgets to the wibox
	s.wibox:setup({
		layout = wibox.layout.align.horizontal,
		expand = "none",
		left_side,
		middle_side,
		right_side,
	})
end)
