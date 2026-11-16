awful.keyboard.append_client_keybindings({
  -- Move (swap) by direction
  awful.key({ config.modkey, "Shift" }, "h", function(c)
    awful.client.swap.bydirection("left", c)
  end, { description = "swap with left client", group = "client" }),
  awful.key({ config.modkey, "Shift" }, "j", function(c)
    awful.client.swap.bydirection("down", c)
  end, { description = "swap with client below", group = "client" }),
  awful.key({ config.modkey, "Shift" }, "k", function(c)
    awful.client.swap.bydirection("up", c)
  end, { description = "swap with client above", group = "client" }),
  awful.key({ config.modkey, "Shift" }, "l", function(c)
    awful.client.swap.bydirection("right", c)
  end, { description = "swap with right client", group = "client" }),

  -- Move by index
  awful.key({ config.modkey, "Shift" }, "]", function()
    awful.client.swap.byidx(1)
  end, { description = "swap with next client by index", group = "client" }),
  awful.key({ config.modkey, "Shift" }, "[", function()
    awful.client.swap.byidx(-1)
  end, { description = "swap with previous client by index", group = "client" }),

  -- Move to screen
  awful.key({ config.modkey, "Mod1", "Shift" }, "h", function(c)
    c:move_to_screen(c.screen:get_next_in_direction("left"))
  end, { description = "move to screen left", group = "client" }),
  awful.key({ config.modkey, "Mod1", "Shift" }, "j", function(c)
    c:move_to_screen(c.screen:get_next_in_direction("down"))
  end, { description = "move to screen below", group = "client" }),
  awful.key({ config.modkey, "Mod1", "Shift" }, "k", function(c)
    c:move_to_screen(c.screen:get_next_in_direction("up"))
  end, { description = "move to screen above", group = "client" }),
  awful.key({ config.modkey, "Mod1", "Shift" }, "l", function(c)
    c:move_to_screen(c.screen:get_next_in_direction("right"))
  end, { description = "move to screen right", group = "client" }),
})
