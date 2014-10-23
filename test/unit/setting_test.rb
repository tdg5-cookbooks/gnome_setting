require 'test_helper'
require_relative '../../libraries/setting'

class SettingTest < Minitest::Unit::TestCase

  def test_normal_schema
    setting_name = 'switch-to-workspace-up'
    setting_value = "['<Control><Alt>Up', '<Control><Alt>k']"
    setting = Gnome::Setting.new('tdg5', 'org.gnome.desktop.wm.keybindings')
    setting.set(setting_name, setting_value)
    assert_equal setting_value, setting.get(setting_name)
  end

  def test_relocatable_schema
    schema = 'org.gnome.settings-daemon.plugins.media-keys.custom-keybinding'
    path = '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/'
    key = 'name'
    value = "'Launch Terminal'"
    setting = Gnome::Setting.new('tdg5', schema, path)
    setting.set(key, value)
    assert_equal value, setting.get(key, path)
  end

  def test_can_target_differnt_users
    setting_name = 'switch-to-workspace-down'
    setting = Gnome::Setting.new('tdg5', 'org.gnome.desktop.wm.keybindings')
    #setting.set(setting_name, setting_value)
    #assert_equal setting_value, setting.get(setting_name)
    other_user_setting = Gnome::Setting.new('root', 'org.gnome.desktop.wm.keybindings')
    refute_equal setting.get(setting_name), other_user_setting.get(setting_name)
  end

end
