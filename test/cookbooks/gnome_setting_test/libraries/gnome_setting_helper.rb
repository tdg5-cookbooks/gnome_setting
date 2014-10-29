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
      :value => 'gnome-session-name',
    },
    :schema_without_path_string_with_quotes => {
      :key => 'network-icon-name',
      :schema => 'org.gnome.nautilus.desktop',
      :user => username,
      :value => %q[it's "gnome" time],
    },
    :schema_without_path_get_typed_uint16 => {
      :key => 'alternative-port',
      :schema => 'org.gnome.Vino',
      :user => username,
      :value => 6000,
    },
    :schema_without_path_get_typed_uint32 => {
      :key => 'idle-delay',
      :schema => 'org.gnome.desktop.session',
      :user => username,
      :value => 300,
    },
    :schema_without_path_get_typed_uint64 => {
      :key => 'thumbnail-limit',
      :schema => 'org.gnome.nautilus.preferences',
      :user => username,
      :value => 10485700,
    },
    :schema_without_path_get_typed_string_array => {
      :key => 'disable',
      :schema => 'org.gnome.desktop.thumbnailers',
      :user => username,
      :value => ['foo'],
    },
    :schema_without_path_get_typed_byte_array => {
      :key => 'bulk-rename-tool',
      :schema => 'org.gnome.nautilus.preferences',
      :user => username,
      :value => [],
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
  }.freeze

end

=begin
  # TODO: Other outliers
  org.gnome.FileRoller.FileSelector window-size (-1, -1)
  org.gnome.desktop.input-sources sources [('xkb', 'us')]
  org.gtk.Settings.ColorChooser selected-color (false, 1.0, 1.0, 1.0, 1.0)
  org.gtk.Settings.ColorChooser custom-colors @a(dddd) []
  org.gnome.GWeather default-location ('', 'KNYC', @m(dd) nothing)
  org.gnome.gnome-system-monitor cpu-colors [(uint32 0, '#FF6E00'), (1, '#CB0C29'), (2, '#49A835'), (3, '#2D7DB3'), (4, '#f25915e815e8'), (5, '#f25915e815e8'), (6, '#f25915e815e8'), (7, '#f25915e815e8')]
  org.gnome.documents window-position @ai []
  org.gnome.rhythmbox.encoding-settings media-type-presets @a{ss} {}
=end
