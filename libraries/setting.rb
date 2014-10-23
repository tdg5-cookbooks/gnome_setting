module Gnome
  class Setting
    attr_reader :path, :schema, :type, :user

    def get(key, path = nil)
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
      cmd << value.to_s.inspect if value
      cmd << '2>/dev/null'
      cmd.join(' ')
    end
  end
end
