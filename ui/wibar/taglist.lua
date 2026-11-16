local buttons = {
  awful.button({}, awful.button.names.LEFT, function(t) t:view_only() end),
  awful.button({ config.modkey }, awful.button.names.LEFT, function(t)
    if client.focus then
      client.focus:move_to_tag(t)
    end
  end),
  awful.button({}, awful.button.names.MIDDLE, awful.tag.viewtoggle),
  awful.button({ config.modkey }, awful.button.names.MIDDLE, function(t)
    if client.focus then
      client.focus:toggle_tag(t)
    end
  end),
  awful.button({}, awful.button.names.SCROLL_DOWN, function(t) awful.tag.viewprev(t.screen) end),
  awful.button({}, awful.button.names.SCROLL_UP, function(t) awful.tag.viewnext(t.screen) end),
}

local function shape(cr, w, h)
  return gears.shape.rectangular_tag(cr, w, h, -h / 2)
end

return function(s)
  local colors = {
    normal = beautiful.taglist_bg_empty,
    focus = beautiful.taglist_bg_focus,
    occupied = beautiful.taglist_bg_occupied
  }

  local start_bg = wibox.container.background()
  local start_widget = {
    widget = start_bg,
    shape = shape,
    forced_width = dpi(10),
    bg = beautiful.bg_focus
  }

  local end_bg = wibox.container.background()
  local end_widget = {
    widget = end_bg,
    {
      widget = wibox.container.background,
      shape = shape,
      forced_width = dpi(14),
      bg = beautiful.bg_normal
    }
  }

  local function update()
    local tags = s.tags
    local last = tags[#tags]
    local first = tags[1]

    if first and first.selected then
      start_bg.bg = colors.focus
    elseif first and #first:clients() > 0 then
      start_bg.bg = colors.occupied
    else
      start_bg.bg = colors.normal
    end

    if last and last.selected then
      end_bg.bg = colors.focus
    elseif last and #last:clients() > 0 then
      end_bg.bg = colors.occupied
    else
      end_bg.bg = colors.normal
    end
  end

  tag.connect_signal("property::selected", function(t)
    if t.screen == s then
      update()
    end
  end)

  local taglist = awful.widget.taglist({
    screen = s,
    buttons = buttons,
    filter = awful.widget.taglist.filter.all,
  })

  update()

  return wibox.widget({
    widget = wibox.container.background,
    {
      widget = wibox.layout.fixed.horizontal,
      start_widget,
      taglist,
      end_widget,
    }
  })
end
