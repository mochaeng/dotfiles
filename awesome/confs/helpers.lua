local wibox = require("wibox")
local gears = require("gears")
local dpi = require("beautiful").xresources.apply_dpi

local helpers = {}

local function rounded_it(widget, bg_color, fg_color)
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
			-- color = "#A020F0",
			bg = bg_color,
			fg = fg_color,
			shape = function(cr, width, height)
				gears.shape.rounded_rect(cr, width, height)
			end,
			widget = wibox.container.background,
		},
		-- external
		right = dpi(4),
		left = dpi(4),
		top = dpi(4),
		bottom = dpi(4),
		widget = wibox.container.margin,
	})
	return w
end

helpers.rounded_it = rounded_it

return helpers
