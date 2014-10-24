module Gnome
  class Setting
    attr_reader :path, :schema, :type, :user

    def self.dump_value_as_serialized_gvariant(value)
      if value.is_a?(String)
        "'#{value}'"
      elsif value.is_a?(Array)
        # TODO: Find a better way to do this
        value.inspect.gsub(/"/, "'")
      elsif value.is_a?(Integer) || value.is_a?(Float)
        value
      else
        value.to_s
      end
    end

    def get(key)
      `#{generate_command(user, :get, schema, path, key)}`.strip
    end

    def initialize(user, schema, path = nil)
      @user, @schema, @path = user, schema, path
    end

    def set(key, value)
      `#{generate_command(user, :set, schema, path, key, value)}`
    end

    private

    def generate_command(user, action, schema, path, key, value = nil)
      cmd = []
      cmd << "sudo -i -u #{user} --" if user
      cmd << "dbus-launch gsettings #{action} #{schema}#{":#{path}" if path}"
      cmd << key
      if value
        value = self.class.dump_value_as_serialized_gvariant(value)
        cmd << value
      end
      cmd << '2>/dev/null'
      cmd.join(' ')
    end
  end
end
