-- See this article to see the equation: https://colby.id.au/calculating-cpu-usage-from-proc-stat/
-- The usage is calculate based on the file "/proc/stat"

local wibox = require("wibox")
local watch = require("awful.widget.watch")

local script = [[bash -c "cat /proc/stat | grep '^cpu\b'"]]
local cpu_usage = wibox.widget.textbox()

local previous_total = 0
local previous_idle = 0

watch(script, 2, function(_, stdout)
  local total = 0
  local fields = {}

  for field in stdout:gmatch("%S+") do
    local value = tonumber(field)
    if value == nil then
      goto continue
    end
    table.insert(fields, value)
    total = total + value

    ::continue::
  end

  local diff_idle = fields[4] - previous_idle
  local diff_total = total - previous_total
  local usage = (1000 * (diff_total - diff_idle) / diff_total + 5) / 10

  cpu_usage.text = math.ceil(usage) .. "%"
  if usage < 10 then
    cpu_usage.text = '0' .. cpu_usage.text
  end

  previous_total = total
  previous_idle = fields[4]

  collectgarbage('collect')
end)

local glyph = "󰻠"
local cpu_usage_icon = wibox.widget {
  font = "Hack Nerd Font 18",
  -- font = theme.font,
  markup = glyph .. " ",
  widget = wibox.widget.textbox()
}

return {
  widget = cpu_usage,
  icon = cpu_usage_icon
}
