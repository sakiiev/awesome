local menu = awful.menu({
  items = require("ui.menu.items")
})

awesome.connect_signal("menu::toggle", function()
  menu:toggle()
end)
