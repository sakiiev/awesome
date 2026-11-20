local sink = "@DEFAULT_AUDIO_SINK@"
local source = "@DEFAULT_AUDIO_SOURCE@"

local function set_sink_volume(amount)
  awful.spawn.easy_async_with_shell(
    "wpctl set-volume " .. sink .. " " .. amount .. " && wpctl get-volume " .. sink .. " | awk '{print $2}'",
    function(stdout)
      local vol = tonumber(stdout) * 100

      local icon
      if vol <= 0 then
        icon = "󰕿"
      elseif vol < 50 then
        icon = "󰖀"
      elseif vol >= 50 then
        icon = "󰕾"
      end

      awesome.emit_signal("osd::level", icon, vol)
    end
  )
end

local function mute_sink_toggle()
  awful.spawn.easy_async_with_shell(
    "wpctl set-mute " .. sink .. " toggle && wpctl get-volume " .. sink,
    function(stdout)
      local vol = tonumber(stdout:match("%d%.%d%d")) * 100 or 0
      local muted = stdout:find("MUTED") ~= nil

      local icon
      if vol <= 0 then
        icon = "󰕿"
      elseif vol < 50 then
        icon = "󰖀"
      elseif vol >= 50 then
        icon = "󰕾"
      end

      if muted then
        icon = "󰖁"
        vol = 0
      end

      awesome.emit_signal("osd::level", icon, vol)
    end
  )
end

local function mute_source_toggle()
  awful.spawn.easy_async_with_shell(
    "wpctl set-mute " .. source .. " toggle && wpctl get-volume " .. source,
    function(stdout)
      local vol = tonumber(stdout:match("%d%.%d%d")) * 100 or 0
      local muted = stdout:find("MUTED") ~= nil

      local icon = "󰍬"

      if muted then
        icon = "󰍭"
        vol = 0
      end

      awesome.emit_signal("osd::level", icon, vol)
    end
  )
end

local function set_brightness(amount)
  awful.spawn.easy_async_with_shell(
    "brightnessctl set " .. amount .. " --quiet && brightnessctl -m",
    function(stdout)
      local out = gears.string.split(stdout, ",")
      local current_brightness = out[3]
      local max_brightness = out[5]
      local brightness_percent = (current_brightness / max_brightness) * 100

      local icon = "󰃠"

      if brightness_percent <= 10 then
        icon = "󰃞"
      elseif brightness_percent <= 50 then
        icon = "󰃟"
      elseif brightness_percent > 50 then
        icon = "󰃠"
      end

      awesome.emit_signal("osd::level", icon, brightness_percent)
    end
  )
end

awful.keyboard.append_global_keybindings({
  -- Volume
  awful.key({}, "XF86AudioRaiseVolume", function()
    set_sink_volume("10%+")
  end, { description = "raise volume", group = "media" }),

  awful.key({}, "XF86AudioLowerVolume", function()
    set_sink_volume("10%-")
  end, { description = "lower volume", group = "media" }),

  awful.key({}, "XF86AudioMute", function()
    mute_sink_toggle()
  end, { description = "toggle mute", group = "media" }),

  -- Microphone
  awful.key({}, "XF86AudioMicMute", function()
    mute_source_toggle()
  end, { description = "toggle microphone mute", group = "media" }),

  -- Playback
  awful.key({}, "XF86AudioPlay", function()
    awful.spawn("playerctl play-pause", false)
  end, { description = "play/pause", group = "media" }),

  awful.key({}, "XF86AudioPause", function()
    awful.spawn("playerctl pause", false)
  end, { description = "pause", group = "media" }),

  awful.key({}, "XF86AudioStop", function()
    awful.spawn("playerctl stop", false)
  end, { description = "stop", group = "media" }),

  awful.key({}, "XF86AudioNext", function()
    awful.spawn("playerctl next", false)
  end, { description = "next track", group = "media" }),

  awful.key({}, "XF86AudioPrev", function()
    awful.spawn("playerctl previous", false)
  end, { description = "previous track", group = "media" }),

  -- Brightness
  awful.key({}, "XF86MonBrightnessUp", function()
    set_brightness("10%+")
  end, { description = "raise brightness", group = "media" }),

  awful.key({}, "XF86MonBrightnessDown", function()
    set_brightness("10%-")
  end, { description = "lower brightness", group = "media" }),
})
