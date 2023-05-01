local wibox = require("wibox")
local watch = require("awful.widget.watch")

local script = [[bash -c "sensors | grep 'Core 0' | awk '{print substr($3, 2, 2)}'"]]
local cpu_temperature = wibox.widget.textbox()

local icon = wibox.widget.textbox("")
icon.font = "Font Awesome 24"

watch(script, 40, function(_, stdout)
  local text = " " .. string.sub(stdout, 1, -2) .. "°C"
  cpu_temperature.text = text
end)

return cpu_temperature
