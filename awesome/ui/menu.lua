local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")
local beautiful = require("beautiful")
local helpers = require("confs.helpers")

-- menubar.utils.terminal = terminal -- Set the terminal for applications that require it

local function create_launcher(main_menu, color, left_width, right_width)
	local launcher = awful.widget.launcher({
		image = beautiful.awesome_icon,
		menu = main_menu,
	})

	launcher = helpers.rounded_it(launcher, color, "", left_width, right_width)
	return launcher
end

local awesome_menu = {
	{
		"hotkeys",
		function()
			hotkeys_popup.show_help(nil, awful.screen.focused())
		end,
	},
	{ "manual", terminal .. " -e man awesome" },
	{ "edit config", editor_cmd .. " " .. awesome.conffile },
	{ "restart", awesome.restart },
	{
		"quit",
		function()
			awesome.quit()
		end,
	},
}

local main_menu = awful.menu({
	items = {
		{ "awesome", awesome_menu, beautiful.awesome_icon },
		{ "open terminal", terminal },
	},
})

local launcher = create_launcher(main_menu, Colors.base, 2, 2)

return { launcher = launcher, main_menu = main_menu }
