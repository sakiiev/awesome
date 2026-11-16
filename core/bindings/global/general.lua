awful.keyboard.append_global_keybindings({
  awful.key({ config.modkey, "Control" }, "r", awesome.restart, { description = "reload awesome", group = "awesome" }),
  awful.key({ config.modkey, "Shift" }, "q", awesome.quit, { description = "quit awesome", group = "awesome" }),

  awful.key({ config.modkey }, "Return", function()
    awful.spawn(config.terminal)
  end, { description = "open a terminal", group = "launcher" }),

  awful.key({ config.modkey }, " ", function()
    awful.spawn(config.app_launcher)
  end, { description = "open the application launcher", group = "launcher" }),
})
