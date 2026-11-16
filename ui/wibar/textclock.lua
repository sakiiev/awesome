local pad = dpi(6)

local widget = {
  widget = wibox.widget.textclock,
  format = "%H:%M",
  halign = "center",
}

local function shape(cr, w, h)
  return gears.shape.rectangular_tag(cr, w, h, h / 2)
end

return function()
  return wibox.widget({
    widget = wibox.container.constraint,
    strategy = "min",
    width = dpi(65),
    {
      widget = wibox.container.background,
      shape = shape,
      bg = beautiful.textclock_bg,
      fg = beautiful.textclock_fg,
      {
        widget = wibox.container.margin,
        left = pad,
        widget
      }
    }
  })
end
