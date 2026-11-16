client.connect_signal("request::default_keybindings", function()
  awful.keyboard.append_client_keybindings({
    awful.key({ config.modkey }, "f", function(c)
      c.maximized = not c.maximized
      c:raise()
    end, { description = "toggle maximize", group = "client" }),

    awful.key({ config.modkey, "Shift" }, "f", function(c)
      c.fullscreen = not c.fullscreen
      c:raise()
    end, { description = "toggle fullscreen", group = "client" }),

    awful.key({ config.modkey, "Control" }, "q", function(c)
      c:kill()
    end, { description = "close", group = "client" }),

    awful.key({ config.modkey }, "v", function(c)
      awful.client.floating.toggle(c)
    end, { description = "toggle floating", group = "client" }),
  })
end)
