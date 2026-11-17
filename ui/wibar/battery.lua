local function shape(cr, w, h)
  return gears.shape.powerline(cr, w, h, -h / 2)
end

return function()
  local battery_path = "/sys/class/power_supply/BAT0"

  local function read_file(path)
    local file = io.open(path, "r")
    if not file then return nil end
    local s = file:read("*l")
    file:close()
    return s
  end

  local label = awful.widget.watch(
    "true",
    30,

    function(widget, _)
      local cap = tonumber(read_file(battery_path .. "/capacity")) or 0
      local status = read_file(battery_path .. "/status") or "Unknown"

      local icon
      if status == "Charging" then
        icon = "󰂄"
      elseif cap > 80 then
        icon = "󰁹"
      elseif cap > 60 then
        icon = "󰂀"
      elseif cap > 40 then
        icon = "󰁾"
      elseif cap > 20 then
        icon = "󰁼"
      else
        icon = "󰂃"
      end

      widget:set_markup(string.format(
        "<span>%s %d%%</span>", icon, cap))
    end,

    wibox.widget.textbox()
  )

  return wibox.widget({
    widget = wibox.container.background,
    shape = shape,
    bg = beautiful.battery_bg,
    fg = beautiful.battery_fg,
    {
      widget = wibox.container.margin,
      left = dpi(15),
      right = dpi(20),
      label,
    }
  })
end
