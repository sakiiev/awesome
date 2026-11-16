local powermenu = {
  { "sleep", "loginctl suspend" },
  { "reboot", "loginctl reboot" },
  { "power off", "loginctl poweroff" },
}

local awesomemenu = {
  { "manual", config.terminal .. " -e man awesome" },
  { "restart", awesome.restart },
  { "quit", function() awesome.quit() end },
}

local system = {
  { "volume", "pavucontrol" }
}

return {
  { "awesome", awesomemenu },
  { "system", system },
  { "", "" },
  { "power", powermenu },
}
