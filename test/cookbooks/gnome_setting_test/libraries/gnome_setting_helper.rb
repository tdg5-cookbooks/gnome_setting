module GnomeSettingHelper

  # Helper method for customizing user to test against
  def self.username
    ENV['GNOME_SETTING_USERNAME'] || 'vagrant'
  end

  # Accessor for SETTINGS constant
  def self.settings
    SETTINGS
  end

  # Settings to test with. The constant is self referential, so should probably
  # be defined last.
  SETTINGS = {
    :favorite_apps => {
      :key => 'favorite-apps',
      :schema => 'org.gnome.shell',
      :user => username,
      :value => [
        'google-chrome.desktop',
        'pidgin.desktop',
        'spotify.desktop',
        'rhythmbox.desktop',
        'nautilus.desktop',
        'gnome-terminal.desktop',
        'gimp.desktop',
        'virtualbox.desktop',
        'firefox.desktop',
      ],
    },
    :move_to_workspace_down_keybindings => {
      :key => 'move-to-workspace-down',
      :schema => 'org.gnome.desktop.wm.keybindings',
      :user => username,
      :value => [
        '<Control><Shift><Alt>Down',
        '<Control><Shift><Alt>j',
      ],
    },
    :move_to_workspace_up_keybindings => {
      :key => 'move-to-workspace-up',
      :schema => 'org.gnome.desktop.wm.keybindings',
      :user => username,
      :value => [
        '<Control><Shift><Alt>Up',
        '<Control><Shift><Alt>k',
      ],
    },
    :switch_to_workspace_up_keybinding => {
      :key => 'switch-to-workspace-up',
      :schema => 'org.gnome.desktop.wm.keybindings',
      :user => username,
      :value => [
        '<Control><Alt>Up',
        '<Control><Alt>k',
      ],
    },
    :switch_to_workspace_down_keybinding => {
      :key => 'switch-to-workspace-down',
      :schema => 'org.gnome.desktop.wm.keybindings',
      :user => username,
      :value => [
        '<Control><Alt>Down',
        '<Control><Alt>j',
      ],
    },
    :launch_terminal_keybinding_name => {
      :key => 'name',
      :path => '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/',
      :schema => 'org.gnome.settings-daemon.plugins.media-keys.custom-keybinding',
      :user => username,
      :value => 'Launch Terminal',
    },
    :launch_terminal_keybinding_command => {
      :key => 'command',
      :path => '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/',
      :schema => 'org.gnome.settings-daemon.plugins.media-keys.custom-keybinding',
      :user => username,
      :value => 'x-terminal-emulator',
    },
    :launch_terminal_keybinding_binding => {
      :key => 'binding',
      :path => '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/',
      :schema => 'org.gnome.settings-daemon.plugins.media-keys.custom-keybinding',
      :user => username,
      :value => '<Primary><Alt>t',
    },
    :launch_chrome_keybinding_name => {
      :key => 'name',
      :path => '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/',
      :schema => 'org.gnome.settings-daemon.plugins.media-keys.custom-keybinding',
      :user => username,
      :value => 'Launch Chrome',
    },
    :launch_chrome_keybinding_command => {
      :key => 'command',
      :path => '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/',
      :schema => 'org.gnome.settings-daemon.plugins.media-keys.custom-keybinding',
      :user => username,
      :value => 'new_chrome_with_focus',
    },
    :launch_chrome_keybinding_binding => {
      :key => 'binding',
      :path => '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/',
      :schema => 'org.gnome.settings-daemon.plugins.media-keys.custom-keybinding',
      :user => username,
      :value => '<Primary><Alt>b',
    },
    :launch_chrome_incognito_name => {
      :key => 'name',
      :path => '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/',
      :schema => 'org.gnome.settings-daemon.plugins.media-keys.custom-keybinding',
      :user => username,
      :value => 'Launch Chrome Incognito',
    },
    :launch_chrome_incognito_command => {
      :key => 'command',
      :path => '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/',
      :schema => 'org.gnome.settings-daemon.plugins.media-keys.custom-keybinding',
      :user => username,
      :value => 'new_chrome_with_focus --incognito',
    },
    :launch_chrome_incognito_binding => {
      :key => 'binding',
      :path => '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/',
      :schema => 'org.gnome.settings-daemon.plugins.media-keys.custom-keybinding',
      :user => username,
      :value => '<Primary><Shift><Alt>b',
    },
    :suspend_keybinding_name => {
      :key => 'name',
      :path => '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/',
      :schema => 'org.gnome.settings-daemon.plugins.media-keys.custom-keybinding',
      :user => username,
      :value => 'Suspend',
    },
    :suspend_keybinding_command => {
      :key => 'command',
      :path => '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/',
      :schema => 'org.gnome.settings-daemon.plugins.media-keys.custom-keybinding',
      :user => username,
      :value => 'dbus-send --system --print-reply --dest=org.freedesktop.UPower /org/freedesktop/UPower org.freedesktop.UPower.Suspend',
    },
    :suspend_keybinding_binding => {
      :key => 'binding',
      :path => '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/',
      :schema => 'org.gnome.settings-daemon.plugins.media-keys.custom-keybinding',
      :user => username,
      :value => '<Primary><Shift><Alt>s',
    },
  }.freeze

end