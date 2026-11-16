package.loaded["naughty.dbus"] = {}

require("core.globals")

beautiful.init(gears.filesystem.get_configuration_dir() .. "theme.lua")

require("awful.autofocus")

require("core.error_handling")
require("core.layouts")
require("core.tags")
require("core.rules")
require("core.bindings")

require("ui.wallpapers")
require("ui.wibar")
require("ui.menu")

require("core.autostart")
