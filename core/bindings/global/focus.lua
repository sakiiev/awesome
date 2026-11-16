awful.keyboard.append_global_keybindings({
  -- Clients
  awful.key({ config.modkey }, "h", function()
    awful.client.focus.bydirection("left")
  end, { description = "focus left", group = "client" }),
  awful.key({ config.modkey }, "j", function()
    awful.client.focus.bydirection("down")
  end, { description = "focus down", group = "client" }),
  awful.key({ config.modkey }, "k", function()
    awful.client.focus.bydirection("up")
  end, { description = "focus up", group = "client" }),
  awful.key({ config.modkey }, "l", function()
    awful.client.focus.bydirection("right")
  end, { description = "focus right", group = "client" }),

  -- By index
  awful.key({ config.modkey }, "]", function()
    awful.client.focus.byidx(1)
  end, { description = "focus next by index", group = "client" }),
  awful.key({ config.modkey }, "[", function()
    awful.client.focus.byidx(-1)
  end, { description = "focus previous by index", group = "client" }),

  -- To screens
  awful.key({ config.modkey, "Mod1" }, "h", function()
    awful.screen.focus_bydirection("left")
  end, { description = "focus screen left", group = "client" }),
  awful.key({ config.modkey, "Mod1" }, "j", function()
    awful.screen.focus_bydirection("down")
  end, { description = "focus screen down", group = "client" }),
  awful.key({ config.modkey, "Mod1" }, "k", function()
    awful.screen.focus_bydirection("up")
  end, { description = "focus screen up", group = "client" }),
  awful.key({ config.modkey, "Mod1" }, "l", function()
    awful.screen.focus_bydirection("right")
  end, { description = "focus screen right", group = "client" }),
})
