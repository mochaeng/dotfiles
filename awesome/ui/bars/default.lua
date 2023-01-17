local beautiful = require("beautiful")
local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local mylauncher = require("ui.menu")
local widgets = require("widgets")

local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local helpers = require("confs.helpers")
local my_tasklist = require("ui.bars.tasklist")

------- ?? Discover
local tasklist_buttons = gears.table.join(
	awful.button({}, 1, function(c)
		if c == client.focus then
			c.minimized = true
		else
			c:emit_signal("request::activate", "tasklist", { raise = true })
		end
	end),

	awful.button({}, 3, function()
		awful.menu.client_list({ theme = { width = 250 } })
	end),

	awful.button({}, 4, function()
		awful.client.focus.byidx(1)
	end),

	awful.button({}, 5, function()
		awful.client.focus.byidx(-1)
	end)
)
-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
	awful.button({}, 1, function(t)
		t:view_only()
	end),
	awful.button({ modkey }, 1, function(t)
		if client.focus then
			client.focus:move_to_tag(t)
		end
	end),
	awful.button({}, 3, awful.tag.viewtoggle),
	awful.button({ modkey }, 3, function(t)
		if client.focus then
			client.focus:toggle_tag(t)
		end
	end),
	awful.button({}, 4, function(t)
		awful.tag.viewnext(t.screen)
	end),
	awful.button({}, 5, function(t)
		awful.tag.viewprev(t.screen)
	end)
)

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

---------------

-- -- Keyboard map indicator and switcher
-- mykeyboardlayout = awful.widget.keyboardlayout()
--
-- -- {{{ Wibar
-- -- Create a textclock widget
-- mytextclock = wibox.widget.textclock()
--
-- praiseWidget = wibox.widget.textbox()
-- praiseWidget.text = "I love Chaeyoung!"

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

awful.screen.connect_for_each_screen(function(s)
	-- Wallpaper
	set_wallpaper(s)

	-- s.bar = awful.wibar({
	--     screen = s,
	--     position = top
	-- })

	-- Each screen has its own tag table.
	awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])

	-- Create a taglist widget
	s.mytaglist = awful.widget.taglist({
		screen = s,
		filter = awful.widget.taglist.filter.all,
		buttons = taglist_buttons,
	})

	s.mytasklist = my_tasklist(s)

	-- Create the wibox
	s.wibox = awful.wibar({
		position = "bottom",
		screen = s,
		width = s.geometry.width - 10,
		-- height = beautiful.wibar_height,
		height = dpi(36),
		shape = function(cr, width, height)
			gears.shape.rounded_rect(cr, width, height, 0)
		end,
		-- shape = gears.shape.rounded_bar,
		bg = "#222",
	})

	-- s.wibox.y = s.geometry.height - 37

	local realbar = wibox.widget({
		{
			layout = wibox.layout.align.horizontal,
			expand = "none",
			{
				{
					layout = wibox.layout.fixed.horizontal,
					-- text_taglist(s),
					s.mytaglist,
				},
				left = beautiful.wibar_spacing,
				right = beautiful.wibar_spacing,
				widget = wibox.container.margin,
			},
			{
				{ -- Middle widgets
					layout = wibox.layout.fixed.horizontal,
					spacing = beautiful.wibar_spacing,
					s.mytasklist,
				},
				left = beautiful.wibar_spacing,
				right = beautiful.wibar_spacing,
				widget = wibox.container.margin,
			},
			{
				{ -- Right widgets
					layout = wibox.layout.fixed.horizontal,
					spacing = beautiful.wibar_spacing,
					widgets.textclock,
					widgets.memory,
					widgets.momo,
					widgets.chae,
					widgets.mysystray,
					widgets.layouts,
				},
				left = beautiful.wibar_spacing,
				right = beautiful.wibar_spacing,
				widget = wibox.container.margin,
			},
		},
		shape = s.wibox.shape,
		bg = beautiful.wibar_bg,
		widget = wibox.container.background,
		forced_width = s.geometry.width,
	})

	-- Add widgets to the wibox
	s.wibox:setup({
		layout = wibox.layout.align.horizontal,
		expand = "none",
		{
			{
				layout = wibox.layout.fixed.horizontal,
				spacing = beautiful.wibar_spacing,
				realbar,
			},
			left = 1,
			right = 1,
			widget = wibox.container.margin,
		},
	})
end)
