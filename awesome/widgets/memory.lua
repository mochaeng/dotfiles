local wibox = require("wibox")
local watch = require("awful.widget.watch")

local script = [[bash -c "free -h | grep Mem | awk '{ print $3 }' | tr -d 'Gi' | sed 's/,/./g'"]]
local memory = wibox.widget.textbox()

watch(script, 2, function(_, stdout)
	memory.text = string.sub(stdout, 1, -2) .. "Gb"
	collectgarbage("collect")
end)

local glyph = "󰍛"
local icon = wibox.widget {
	font = "Hack Nerd Font 18",
	markup = glyph .. " ",
	widget = wibox.widget.textbox()
}

return {
	widget = memory,
	icon = icon
}
