require ::File.expand_path('../../libraries/setting', __FILE__)

action :set do
  ENV['DISPLAY'] ||= ':0'
  setting = Gnome::Setting.new(new_resource.type, new_resource.schema, new_resource.path)
  key, value = new_resource.key, new_resource.value
  current_value = setting.get(key)
  Chef::Log.debug("Current value for gnome setting #{new_resource.key}: #{current_value}")
  Chef::Log.debug("Expected value for gnome setting #{new_resource.key}: #{value}")
  if current_value != value
    setting.set(key, value)
    new_resource.updated_by_last_action(true)
  end
end
