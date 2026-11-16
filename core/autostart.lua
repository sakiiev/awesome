local lock = "/tmp/awesome_autostart.lock"
if not gears.filesystem.file_readable(lock) then
  io.open(lock, "w"):close()

  awful.spawn.with_shell("pipewire")
  awful.spawn.with_shell("picom")
  awful.spawn.with_shell("easyeffects -w")
  awful.spawn.with_shell("ksnip")
  awful.spawn.with_shell("$HOME/.local/bin/tidarr-mount")
end
