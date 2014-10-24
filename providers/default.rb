require ::File.expand_path('../../libraries/setting', __FILE__)

action :set do
  path, schema, user = new_resource.path, new_resource.schema, new_resource.user
  key, value = new_resource.key, new_resource.value
  setting = Gnome::Setting.new(user, schema, path)
  current_value = setting.get(key)
  id = "#{schema}#{":#{path}" if path} #{key} for #{user}"
  if current_value != serialize_gvariant(value)
    converge_by("Setting Gnome setting #{id} to #{value} from #{current_value}") do
      setting.set(key, value)
    end
  else
    Chef::Log.debug("Gnome setting for #{id} already set to #{value}")
  end
end

def serialize_gvariant(value)
  value.inspect.gsub(/"/, "'")
end

def whyrun_supported?
  true
end
