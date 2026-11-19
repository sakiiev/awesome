local popup = awful.popup({
  visible = false,
  ontop = true,
  placement = function(c)
    awful.placement.bottom(c, {
      margins = {
        bottom = dpi(240)
      },
    })
  end,

  bg = beautiful.bg_normal,
  shape = gears.shape.rectangle,

  border_width = beautiful.border_width,
  border_color = beautiful.border_color_normal,

  widget = {
    widget = wibox.container.constraint,
    strategy = "exact",
    width = dpi(160),
    height = dpi(24),
    {
      widget = wibox.layout.align.horizontal,
      {
        widget = wibox.container.margin,
        left = dpi(8),
        right = dpi(8),
        {
          widget = wibox.widget.textbox,
          markup = "<span font_size='12pt'>󰕾</span>",
          align = "center",
          valign = "center",
          forced_width = dpi(12),
          id = "text_icon"
        }
      },
      {
        widget = wibox.container.margin,
        -- left = dpi(10),
        right = dpi(6),
        top = dpi(6),
        bottom = dpi(6),
        {
          widget = wibox.widget.progressbar,
          value = 50,
          max_value = 100,
          color = beautiful.osd_bar_fg,
          background_color = beautiful.osd_bar_bg,
          id = "level",
        }
      }
    }
  }
})

local hide_timer = gears.timer({
  timeout = 2,
  single_shot = true,
  callback = function()
    popup.visible = false
  end
})

local text_icon = popup.widget:get_children_by_id("text_icon")[1]
local level_bar = popup.widget:get_children_by_id("level")[1]

awesome.connect_signal("osd::level", function(icon, level)
  text_icon.markup = "<span font_size='12pt'>" .. icon .. "</span>"
  level_bar.value = level

  popup.visible = true
  hide_timer:again()
end)
