local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")
local dpi = require("beautiful").xresources.apply_dpi

local helpers = {}

local function rounded_it(widget, bg_color, fg_color, left_width, right_width)
	local w = wibox.widget({
		{
			{
				{
					widget,
					right = dpi(2),
					left = dpi(2),
					-- color = "#FF0000",
					widget = wibox.container.margin,
				},
				top = dpi(3),
				bottom = dpi(3),
				left = dpi(4),
				right = dpi(4),
				-- color = "#00FF00",
				widget = wibox.container.margin,
			},
			-- color = "#0000FF",
			bg = bg_color,
			fg = fg_color,
			shape = function(cr, width, height)
				gears.shape.rounded_rect(cr, width, height)
			end,
			widget = wibox.container.background,
		},
		-- external
		-- color = "#0000FF",
		right = dpi(right_width),
		left = dpi(left_width),
		top = dpi(4),
		bottom = dpi(4),
		widget = wibox.container.margin,
	})
	return w
end

local rounded_shape = function(cr, width, height)
	gears.shape.rounded_rect(cr, width, height)
end

local function round_container(container, bg_color, top, right, bottom, left)
	local background = wibox.container.background(container, bg_color)
	local margin = wibox.container.margin(background, top, right, bottom, left)

	background.shape = rounded_shape

	return margin
end

local function set_wallpaper(s)
	if beautiful.wallpaper then
		local wallpaper = beautiful.wallpaper
		-- If wallpaper is a function, call it with the screen
		if type(wallpaper) == "function" then
			wallpaper = wallpaper(s)
		end
		gears.wallpaper.maximized(wallpaper, s, false)
	end
end

helpers.rounded_it = rounded_it
helpers.round_container = round_container
helpers.set_wallpaper = set_wallpaper

return helpers
