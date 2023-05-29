local wibox = require("wibox")
local watch = require("awful.widget.watch")

local script = [[bash -c "sensors | grep 'Core 0' | awk '{print substr($3, 2, 2)}'"]]
local widget = wibox.widget.textbox()

watch(script, 10, function(_, stdout)
	local text = string.sub(stdout, 1, -2) .. "°C"
	widget.text = text
end)

local glyph = ""
local icon = wibox.widget({
	font = "Hack Nerd Font 16",
	-- font = theme.font,
	markup = glyph .. " ",
	widget = wibox.widget.textbox(),
})

return {
	widget = widget,
	icon = icon,
}
