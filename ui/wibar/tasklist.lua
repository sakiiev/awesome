local buttons = {
  awful.button({}, 1, function(c)
    c:activate { context = "tasklist", action = "toggle_minimization" }
  end),
  awful.button({}, 3, function() awful.menu.client_list { theme = { width = 250 } } end),
  awful.button({}, 4, function() awful.client.focus.byidx(-1) end),
  awful.button({}, 5, function() awful.client.focus.byidx(1) end),
}

local function shape(cr, w, h)
  return gears.shape.parallelogram(cr, w, h, w - dpi(8))
end

return function(s)
  return awful.widget.tasklist({
    screen = s,
    buttons = buttons,

    filter = awful.widget.tasklist.filter.currenttags,

    layout = {
      layout = wibox.layout.fixed.horizontal,
      spacing = -dpi(4)
    },

    widget_template = {
      widget = wibox.container.constraint,
      strategy = "max",
      width = dpi(120),
      {
        widget = wibox.container.background,
        id = "background_role",
        {
          widget = wibox.container.margin,
          left = dpi(24),
          right = dpi(24),
          {
            widget = wibox.container.place,
            valign = "center",
            {
              widget = wibox.widget.textbox,
              id = "text_role"
            }
          }
        }
      }
    },

    style = { shape = shape }
  })
end
