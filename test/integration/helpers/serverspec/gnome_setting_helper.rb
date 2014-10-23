# A dodgy path is better than repeating test attributes and configuration
cookbooks_path = File.expand_path('../../../../kitchen/cookbooks', __FILE__)
[
  'gnome_setting_test/libraries/gnome_setting_helper',
  'gnome_setting/libraries/setting',
].each { |lib_path| require File.join(cookbooks_path, lib_path) }
