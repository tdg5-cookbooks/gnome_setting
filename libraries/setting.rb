module Gnome
  class Setting
    attr_reader :path, :schema, :type, :user

    def self.dump_value_as_serialized_gvariant(value)
      if value.is_a?(String)
        # gsettings prefers single quotes for strings without apostrophes
        /'/ === value ? value.inspect : "'#{value}'"
      elsif value.is_a?(Array)
        values = value.map { |item| dump_value_as_serialized_gvariant(item) }
        %Q([#{values.join(', ')}])
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
      cmd << value if value
      cmd << '2>/dev/null'
      cmd.join(' ')
    end
  end
end
