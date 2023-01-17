local wibox = require("wibox")
local watch = require("awful.widget.watch")

local memory = wibox.widget.textbox()

-- using ripgrep
watch([[bash -c "free -h | rg Mem | awk '{ print $3 }' | sed s/i//g"]], 2, function(_, stdout)
	memory.text = " " .. stdout
end)

return memory
