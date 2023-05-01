local wibox = require("wibox")
local watch = require("awful.widget.watch")

local script = [[bash -c "free -h | grep Mem | awk '{ print $3 }' | sed s/i//g"]]
local memory = wibox.widget.textbox()

watch(script, 2, function(_, stdout)
	memory.text = stdout
	collectgarbage("collect")
end)

local glyph = ""
local icon = wibox.widget {
	markup = glyph .. " ",
	widget = wibox.widget.textbox()
}

return {
	widget = memory,
	icon = icon
}
