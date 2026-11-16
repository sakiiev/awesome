local rules = {
  require("core.rules.default"),
  require("core.rules.titlebars"),
  require("core.rules.no_titlebars"),
  require("core.rules.floating"),
  require("core.rules.special")
}

ruled.client.connect_signal("request::rules", function()
  for _, rule in ipairs(rules) do
    ruled.client.append_rule(rule)
  end
end)
