{ config, ... }:
{
  security.polkit.extraConfig = ''
    // See the polkit(8) man page for more information
    // about configuring polkit.

    // Allow udisks2 to mount devices without authentication
    // for users in the "wheel" group.
    polkit.addRule(function(action, subject) {
      if ((action.id == "org.freedesktop.udisks2.filesystem-mount-system" ||
        action.id == "org.freedesktop.udisks2.filesystem-mount") &&
        subject.isInGroup("wheel")) {
        return polkit.Result.YES;
      }
    });
  '';
}
