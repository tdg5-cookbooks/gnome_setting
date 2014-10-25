require ::File.expand_path('../../libraries/setting', __FILE__)

action :set do
  path, schema, user = new_resource.path, new_resource.schema, new_resource.user
  key, value = new_resource.key, new_resource.value
  setting = Gnome::Setting.new(user, schema, path)
  current_value = setting.get(key)
  id = "#{schema}#{":#{path}" if path} #{key} for user #{user}"
  serialized_value = Gnome::Setting.dump_value_as_serialized_gvariant(new_resource.value)
  if current_value != serialized_value
    converge_by("Setting Gnome setting #{id} from #{current_value} to #{value}") do
      setting.set(key, serialized_value)
    end
  else
    Chef::Log.debug("Gnome setting for #{id} already set to #{value}")
  end
end

def whyrun_supported?
  true
end
