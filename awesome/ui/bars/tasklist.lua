local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")

local tasklist_buttons = gears.table.join(
    awful.button({}, 1, function(c)
        if c == client.focus then
            c.minimized = true
        else
            c:emit_signal("request::activate", "tasklist", { raise = true })
        end
    end),
    awful.button({}, 3, function() awful.menu.client_list({ theme = { width = 250 } }) end),
    awful.button({}, 4, function() awful.client.focus.byidx(1) end),
    awful.button({}, 5, function() awful.client.focus.byidx(-1) end)
)

local function create_tasklist(s)
    return awful.widget.tasklist({
        screen = s,
        filter = awful.widget.tasklist.filter.currenttags,
        buttons = tasklist_buttons,
        layout = {
            spacing = 20,
            spacing_widget = {
                {
                    forced_width = 10,
                    shape = gears.shape.circle,
                    widget = wibox.widget.separator,
                },
                valign = "center",
                halign = "center",
                widget = wibox.container.place,
            },
            layout = wibox.layout.flex.horizontal,
        },
        widget_template = {
            {
                {
                    {
                        {
                            {
                                id = "icon_role",
                                widget = wibox.widget.imagebox,
                            },
                            margins = 2,
                            widget = wibox.container.margin,
                        },
                        layout = wibox.layout.fixed.horizontal,
                    },
                    right = 8,
                    left = 8,
                    -- top = 2,
                    -- bottom = 2,
                    widget = wibox.container.margin,
                },
                widget = wibox.container.background,
                -- bg = "#e6e9ef",
                -- bg = "#fe640b",
                bg = Colors.lavender,
                shape = function(cr, width, height)
                    gears.shape.rounded_rect(cr, width, height, 8)
                end
            },
            widget = wibox.container.margin,
            top = 2,
            right = 2,
            bottom = 2,
            left = 2
        },
    })
end

return create_tasklist
