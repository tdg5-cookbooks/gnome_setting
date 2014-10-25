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
    :schema_without_path_boolean => {
      :key => 'clock-show-date',
      :schema => 'org.gnome.desktop.interface',
      :user => username,
      :value => true,
    },
    :schema_without_path_integer => {
      :key => 'text-ellipsis-limit',
      :schema => 'org.gnome.nautilus.desktop',
      :user => username,
      :value => 5,
    },
    :schema_without_path_float => {
      :key => 'difficulty',
      :schema => 'org.gnome.gnome-sudoku',
      :user => username,
      :value => 10.0,
    },
    :schema_without_path_string => {
      :key => 'session-name',
      :schema => 'org.gnome.desktop.session',
      :user => username,
      :value => "gnome",
    },
    :schema_without_path_string_with_quotes => {
      :key => 'network-icon-name',
      :schema => 'org.gnome.nautilus.desktop',
      :user => username,
      :value => %q[it's "gnome" time],
    },
    :schema_without_path_array_of_strings => {
      :key => 'favorite-apps',
      :schema => 'org.gnome.shell',
      :user => username,
      :value => [
        'firefox.desktop',
        'gimp.desktop',
        'gnome-terminal.desktop',
        'nautilus.desktop',
        'pidgin.desktop',
        'rhythmbox.desktop',
      ],
    },
    :schema_with_path_string => {
      :key => 'name',
      :path => '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/',
      :schema => 'org.gnome.settings-daemon.plugins.media-keys.custom-keybinding',
      :user => username,
      :value => 'Launch Terminal',
    },
    :launch_terminal_keybinding_command => {
      :key => 'application-id',
      :path => '/',
      :schema => 'org.gnome.desktop.notifications.application',
      :user => username,
      :value => 'alert',
    },
  }.freeze

end
