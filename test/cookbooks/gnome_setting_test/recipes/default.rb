include_recipe  'gnome_setting'

GnomeSettingHelper.settings.each_pair do |name, setting|
  Chef::Log.warn("Adding gnome setting #{name}")
  gnome_setting name do
    action :set
    key setting[:key]
    path setting[:path] if setting[:path]
    schema setting[:schema]
    user setting[:user]
    value setting[:value]
  end
end
