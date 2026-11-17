screen.connect_signal("request::wallpaper", function(s)
  local systray = nil
  if s == screen.primary then
    systray = wibox.widget({
      widget = wibox.container.margin,
      wibox.widget.systray(),
      right = dpi(16),
    })
  end

  s.wibar = awful.wibar({
    screen = s,
    position = "top",
    height = dpi(16),

    widget = {
      widget = wibox.layout.align.horizontal,
      {
        layout = wibox.layout.fixed.horizontal,
        spacing = -dpi(15),
        require("ui.wibar.layoutbox")(s),
        require("ui.wibar.taglist")(s)
      },
      {
        widget = wibox.layout.flex.horizontal,
        require("ui.wibar.tasklist")(s)
      },
      {
        layout = wibox.layout.fixed.horizontal,
        spacing = -dpi(10),
        systray,
        require("ui.wibar.battery")(),
        require("ui.wibar.language")(),
        require("ui.wibar.textclock")()
      },
    }
  })
end)
