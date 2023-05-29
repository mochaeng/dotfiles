-------------------------------
--  "Zenburn" awesome theme  --
--    By Adrian C. (anrxc)   --
-------------------------------

local themes_path = require("gears.filesystem").get_themes_dir()
local dpi = require("beautiful.xresources").apply_dpi

local catppuccin_mocha = require("themes.colors.catppuccin.mocha")

Colors = catppuccin_mocha

local theme = {}
theme.wallpaper = "~/Pictures/more_wallhaven/wallhaven-m31958.jpg"


-- Styles
theme.font = "Hack Nerd Font 10"

-- Colors
theme.fg_normal = "#DCDCCC"
theme.fg_focus = "#F0DFAF"
theme.fg_urgent = "#CC9393"
theme.bg_normal = "#3F3F3F"
theme.bg_focus = "#1E2320"
theme.bg_urgent = "#3F3F3F"
theme.bg_systray = Colors.overlay1

-- Borders
theme.useless_gap = dpi(2)
theme.border_width = dpi(3)
theme.border_normal = Colors.base
theme.border_focus = Colors.lavender
theme.border_marked = "#CC9393"

-- Titlebars
theme.titlebar_bg_focus = Colors.base
theme.titlebar_bg_normal = Colors.base

-- Tasklist
theme.tasklist_bg_normal = "#0000FF"
theme.tasklist_bg_focus = "#0000FF"
theme.tasklist_bg_urgent = "#0000FF"
theme.tasklist_plain_task_name = false
theme.tasklist_disable_task_name = false
theme.tasklist_disable_icon = false

-- Taglist
theme.taglist_bg_focus = Colors.overlay1
theme.taglist_fg_focus = Colors.lavender
theme.taglist_bg_urgent = Colors.red
theme.taglist_bg_empty = "#FFF00"
-- theme.taglist_fg_empty  = Colors.teal
theme.taglist_fg_urgent = Colors.lavender

-- Mouse finder
theme.mouse_finder_color = "#CC9393"
-- mouse_finder_[timeout|animate_timeout|radius|factor]

theme.menu_height = dpi(15)
theme.menu_width = dpi(100)

-- Taglist
theme.taglist_squares_sel = themes_path .. "zenburn/taglist/squarefz.png"
theme.taglist_squares_unsel = themes_path .. "zenburn/taglist/squarez.png"
--theme.taglist_squares_resize = "false"

-- Misc
theme.awesome_icon = themes_path .. "zenburn/awesome-icon.png"
theme.menu_submenu_icon = themes_path .. "default/submenu.png"

-- Layout
theme.layout_tile = themes_path .. "zenburn/layouts/tile.png"
theme.layout_tileleft = themes_path .. "zenburn/layouts/tileleft.png"
theme.layout_tilebottom = themes_path .. "zenburn/layouts/tilebottom.png"
theme.layout_tiletop = themes_path .. "zenburn/layouts/tiletop.png"
theme.layout_fairv = themes_path .. "zenburn/layouts/fairv.png"
theme.layout_fairh = themes_path .. "zenburn/layouts/fairh.png"
theme.layout_spiral = themes_path .. "zenburn/layouts/spiral.png"
theme.layout_dwindle = themes_path .. "zenburn/layouts/dwindle.png"
theme.layout_max = themes_path .. "zenburn/layouts/max.png"
theme.layout_fullscreen = themes_path .. "zenburn/layouts/fullscreen.png"
theme.layout_magnifier = themes_path .. "zenburn/layouts/magnifier.png"
theme.layout_floating = themes_path .. "zenburn/layouts/floating.png"
theme.layout_cornernw = themes_path .. "zenburn/layouts/cornernw.png"
theme.layout_cornerne = themes_path .. "zenburn/layouts/cornerne.png"
theme.layout_cornersw = themes_path .. "zenburn/layouts/cornersw.png"
theme.layout_cornerse = themes_path .. "zenburn/layouts/cornerse.png"

-- {{{ Titlebar
theme.titlebar_close_button_focus = themes_path .. "zenburn/titlebar/close_focus.png"
theme.titlebar_close_button_normal = themes_path .. "zenburn/titlebar/close_normal.png"

theme.titlebar_minimize_button_normal = themes_path .. "default/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus = themes_path .. "default/titlebar/minimize_focus.png"

theme.titlebar_ontop_button_focus_active = themes_path .. "zenburn/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active = themes_path .. "zenburn/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive = themes_path .. "zenburn/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive = themes_path .. "zenburn/titlebar/ontop_normal_inactive.png"

theme.titlebar_sticky_button_focus_active = themes_path .. "zenburn/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active = themes_path .. "zenburn/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive = themes_path .. "zenburn/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive = themes_path .. "zenburn/titlebar/sticky_normal_inactive.png"

theme.titlebar_floating_button_focus_active = themes_path .. "zenburn/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active = themes_path .. "zenburn/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive = themes_path .. "zenburn/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive = themes_path .. "zenburn/titlebar/floating_normal_inactive.png"

theme.titlebar_maximized_button_focus_active = themes_path .. "zenburn/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active = themes_path .. "zenburn/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive = themes_path .. "zenburn/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = themes_path .. "zenburn/titlebar/maximized_normal_inactive.png"

return theme
