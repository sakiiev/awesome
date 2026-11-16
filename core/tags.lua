local tags = {
  { name = "1", layout = awful.layout.suit.tile },
  { name = "2", layout = awful.layout.suit.max },
  { name = "3", layout = awful.layout.suit.max },
  { name = "4", layout = awful.layout.suit.floating },
  { name = "5", layout = awful.layout.suit.floating },
  { name = "6", layout = awful.layout.suit.floating },
  { name = "7", layout = awful.layout.suit.floating },
  { name = "8", layout = awful.layout.suit.floating },
  { name = "9", layout = awful.layout.suit.floating },
}

screen.connect_signal("request::desktop_decoration", function(s)
  for i, tag in ipairs(tags) do
    awful.tag.add(tag.name, {
      screen = s,
      layout = tag.layout,
      selected = (i == 1)
    })
  end
end)
