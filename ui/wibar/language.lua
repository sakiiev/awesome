local function shape(cr, w, h)
  return gears.shape.powerline(cr, w, h, -h / 2)
end

return function()
  local kbd = awful.widget.keyboardlayout()

  local label = wibox.widget({
    widget = wibox.widget.textbox,
  })

  local function sync()
    label.text = ("󰗊 " .. (kbd.widget:get_text() or ""):gsub("%s+", ""))
  end

  sync()
  awesome.connect_signal("xkb::group_changed", sync)
  awesome.connect_signal("xkb::map_changed", sync)

  return wibox.widget({
    widget = wibox.container.background,
    shape = shape,
    bg = beautiful.language_bg,
    fg = beautiful.textclock_fg,
    {
      widget = wibox.container.margin,
      left = dpi(15),
      right = dpi(20),
      label,
    }
  })
end
