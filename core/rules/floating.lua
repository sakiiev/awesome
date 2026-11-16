return {
  id = "floating",
  rule_any = {
    instance = { "copyq", "pinentry" },
    class = {
      "Arandr", "Blueman-manager", "Gpick",
      "Kruler", "Sxiv", "Tor Browser",
      "Wpa_gui", "veromix", "xtightvncviewer",
    },
    name = {
      "Event Tester", -- xev.
    },
    role = {
      "AlarmWindow",   -- Thunderbird's calendar.
      "ConfigManager", -- Thunderbird's about:config.
      "pop-up",        -- e.g. Google Chrome's (detached) Developer Tools.
    },
  },
  properties = {
    floating = true,
  },
}
