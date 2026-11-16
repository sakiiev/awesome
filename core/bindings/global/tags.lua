awful.keyboard.append_global_keybindings({
  awful.key({
    modifiers = { config.modkey },
    keygroup = "numrow",
    description = "only view tag",
    group = "tag",
    on_press = function(index)
      local screen = awful.screen.focused()
      local tag = screen.tags[index]
      if tag then
        tag:view_only()
      end
    end,
  }),

  awful.key({
    modifiers = { config.modkey, "Shift" },
    keygroup = "numrow",
    description = "move focused client",
    group = "tag",
    on_press = function(index)
      if client.focus then
        local tag = client.focus.screen.tags[index]
        if tag then
          client.focus:move_to_tag(tag)
        end
      end
    end,
  }),
})
