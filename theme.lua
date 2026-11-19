local theme_assets = require("beautiful.theme_assets")
local rnotification = require("ruled.notification")
local recolor = gears.color.recolor_image

local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()
local resources_path = gfs.get_configuration_dir() .. "resources/"

local theme = {}

local colors = {
  bg0_h = "#1d2021",
  bg0 = "#282828",
  bg1 = "#3c3836",
  bg2 = "#504945",
  bg3 = "#665c54",
  bg4 = "#7c6f64",

  fg0 = "#fbf1c7",
  fg1 = "#ebdbb2",
  fg2 = "#d5c4a1",
  fg3 = "#bdae93",
  fg4 = "#a89984",

  gray = "#928374",

  red = "#fb4934",
  green = "#b8bb26",
  yellow = "#fabd2f",
  blue = "#83a598",
  purple = "#d3869b",
  aqua = "#8ec07c",
  orange = "#fe8019",

  neutral_red = "#cc241d",
  neutral_green = "#98971a",
  neutral_yellow = "#d79921",
  neutral_blue = "#458588",
  neutral_purple = "#b16286",
  neutral_aqua = "#689d6a",
  neutral_orange = "#d65d0e",

  faded_red = "#9d0006",
  faded_green = "#79740e",
  faded_yellow = "#b57614",
  faded_blue = "#076678",
  faded_purple = "#8f3f71",
  faded_aqua = "#427b58",
  faded_orange = "#af3a03",
}
theme.colors = colors

theme.font = "GeistMono NFM SemiBold 8"

-- Base
theme.bg_normal = colors.bg0
theme.bg_focus = colors.bg2
theme.bg_urgent = colors.neutral_red
theme.bg_minimize = colors.bg0_h
theme.bg_systray = theme.bg_normal

theme.fg_normal = colors.fg1
theme.fg_focus = colors.fg0
theme.fg_urgent = colors.fg0
theme.fg_minimize = colors.gray

theme.useless_gap = dpi(0)
theme.border_width = dpi(2)
theme.border_color_normal = colors.bg1
theme.border_color_active = colors.bg3
theme.border_color_urgent = colors.neutral_red
theme.border_color_marked = colors.neutral_purple

-- Wibar
theme.wibar_bg = colors.bg0
theme.wibar_fg = colors.fg1

-- Taglist
theme.taglist_bg_empty = colors.bg0_h
theme.taglist_fg_empty = colors.bg3
theme.taglist_bg_focus = theme.bg_focus
theme.taglist_fg_focus = colors.fg0
theme.taglist_bg_occupied = colors.bg1
theme.taglist_fg_occupied = colors.fg0

-- Tasklist
theme.tasklist_bg_normal = colors.bg1
theme.tasklist_fg_normal = colors.fg2
theme.tasklist_bg_focus = colors.bg2
theme.tasklist_fg_focus = colors.fg0
theme.tasklist_bg_urgent = colors.neutral_red
theme.tasklist_fg_urgent = colors.fg0
theme.tasklist_bg_minimize = colors.bg0_h
theme.tasklist_fg_minimize = colors.gray

-- OSD
theme.osd_bar_fg = colors.fg2
theme.osd_bar_bg = colors.bg0_h

-- Powerline segments (bg = accent, fg = dark text)
theme.layoutbox_bg = colors.neutral_yellow
theme.layoutbox_fg = colors.bg0_h

theme.battery_bg = colors.neutral_aqua
theme.battery_fg = colors.bg0_h

theme.language_bg = colors.neutral_blue
theme.language_fg = colors.bg0_h

theme.textclock_bg = colors.neutral_yellow
theme.textclock_fg = colors.bg0_h

-- Titlebars
theme.titlebar_bg_normal = colors.bg0
theme.titlebar_fg_normal = colors.gray
theme.titlebar_bg_focus = colors.bg1
theme.titlebar_fg_focus = colors.fg1
theme.titlebar_bg_urgent = colors.neutral_red
theme.titlebar_fg_urgent = colors.fg0

-- Tooltips
theme.tooltip_bg = colors.bg0_h
theme.tooltip_fg = colors.fg1
theme.tooltip_border_color = colors.bg2
theme.tooltip_border_width = dpi(1)

-- Prompt
theme.prompt_bg = colors.bg1
theme.prompt_fg = colors.fg1
theme.prompt_bg_cursor = colors.yellow
theme.prompt_fg_cursor = colors.bg0_h

-- Hotkeys popup
theme.hotkeys_bg = colors.bg0
theme.hotkeys_fg = colors.fg1
theme.hotkeys_border_color = colors.neutral_yellow
theme.hotkeys_border_width = dpi(2)
theme.hotkeys_modifiers_fg = colors.gray
theme.hotkeys_label_bg = colors.yellow
theme.hotkeys_label_fg = colors.bg0_h
theme.hotkeys_group_margin = dpi(16)

-- Notifications
theme.notification_bg = colors.bg0
theme.notification_fg = colors.fg1
theme.notification_border_color = colors.bg2
theme.notification_border_width = dpi(2)
theme.notification_margin = dpi(8)
theme.notification_icon_size = dpi(48)

-- Menu
theme.menu_bg_normal = colors.bg0
theme.menu_fg_normal = colors.fg1
theme.menu_bg_focus = colors.neutral_yellow
theme.menu_fg_focus = colors.bg0_h
theme.menu_border_color = colors.bg2
theme.menu_border_width = dpi(1)
theme.menu_submenu_icon = recolor(themes_path .. "default/submenu.png", colors.fg4)
theme.menu_height = dpi(16)
theme.menu_width = dpi(110)

-- Taglist squares
local taglist_square_size = dpi(4)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
  taglist_square_size, colors.fg0
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
  taglist_square_size, colors.fg0
)

-- Titlebar buttons
local tb = themes_path .. "default/titlebar/"
local button_colors = {
  close = colors.red,
  minimize = colors.yellow,
  maximized = colors.green,
  floating = colors.blue,
  ontop = colors.orange,
  sticky = colors.purple,
}

for name, color in pairs(button_colors) do
  if name == "close" or name == "minimize" then
    theme["titlebar_" .. name .. "_button_normal"] = recolor(tb .. name .. "_normal.png", colors.bg4)
    theme["titlebar_" .. name .. "_button_focus"] = recolor(tb .. name .. "_focus.png", color)
  else
    for _, state in ipairs({ "normal", "focus" }) do
      local inactive = state == "focus" and colors.fg4 or colors.bg4
      local active = state == "focus" and color or colors.bg4
      theme["titlebar_" .. name .. "_button_" .. state .. "_inactive"] =
          recolor(tb .. name .. "_" .. state .. "_inactive.png", inactive)
      theme["titlebar_" .. name .. "_button_" .. state .. "_active"] =
          recolor(tb .. name .. "_" .. state .. "_active.png", active)
    end
  end
end

theme.wallpaper = resources_path .. "wallpapers.png"

-- Layout icons
local layouts_path = themes_path .. "default/layouts/"
for _, name in ipairs({
  "fairh", "fairv", "floating", "magnifier", "max", "fullscreen",
  "tilebottom", "tileleft", "tile", "tiletop", "spiral", "dwindle",
  "cornernw", "cornerne", "cornersw", "cornerse",
}) do
  theme["layout_" .. name] = recolor(layouts_path .. name .. ".png", theme.layoutbox_fg)
end

-- Awesome icon
theme.awesome_icon = theme_assets.awesome_icon(
  theme.menu_height, colors.neutral_yellow, colors.bg0_h
)

theme.icon_theme = nil

rnotification.connect_signal("request::rules", function()
  rnotification.append_rule {
    rule = { urgency = "critical" },
    properties = {
      bg = colors.neutral_red,
      fg = colors.fg0,
      border_color = colors.red,
    }
  }
  rnotification.append_rule {
    rule = { urgency = "low" },
    properties = { fg = colors.fg4 }
  }
end)

return theme
