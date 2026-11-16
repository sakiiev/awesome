awful.mouse.append_global_mousebindings({
  awful.button({}, 3, function() awesome.emit_signal("menu::toggle") end),
  -- I just hate these keybinds :)
  -- awful.button({}, 4, awful.tag.viewprev),
  -- awful.button({}, 5, awful.tag.viewnext),
})
