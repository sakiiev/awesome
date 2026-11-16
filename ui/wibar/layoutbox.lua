local buttons = {
  awful.button({}, awful.button.names.LEFT, function()
    awful.layout.inc(1)
  end),
  awful.button({}, awful.button.names.RIGHT, function()
    awful.layout.inc(-1)
  end),
  awful.button({}, awful.button.names.SCROLL_UP, function()
    awful.layout.inc(1)
  end),
  awful.button({}, awful.button.names.SCROLL_DOWN, function()
    awful.layout.inc(-1)
  end),
}

local function shape(cr, w, h)
  return gears.shape.rectangular_tag(cr, w, h, -h / 2)
end

return function(s)
  local end_widget = {
    widget = wibox.container.background,
    {
      widget = wibox.container.background,
      shape = shape,
      forced_width = dpi(14),
      bg = beautiful.bg_normal
    }
  }

  return wibox.widget({
    widget = wibox.container.background,
    bg = beautiful.layoutbox_bg,
    fg = "#000000",
    {
      widget = wibox.layout.fixed.horizontal,
      {
        widget = wibox.container.margin,
        left = dpi(2),
        right = dpi(5),
        {
          widget = awful.widget.layoutbox,
          screen = s,
          buttons = buttons
        }
      },
      end_widget
    }
  })
end
