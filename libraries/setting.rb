module Gnome
  class Setting
    attr_reader :path, :schema, :type

    def get(key)
      case type
      when :String
        method_name = :get_string
      when :StringList
        method_name = :get_string_list
      else
        raise "TODO: Support #{type.class.name}s"
      end
      send(method_name, key)
    end

    def initialize(type, schema, path = nil)
      @type, @schema, @path = type, schema, path
      @client = Gio::Settings.new(*[schema, path].compact)
    end

    def set(key, value)
      case type
      when :String
        method_name = :set_string
      when :StringList
        method_name = :set_string_list
      else
        raise "TODO: Support #{type.class.name}s"
      end
      send(method_name, key, value)
    end

    private

    def get_string(key)
      @client.get_string(key)
    end

    def set_string(key, value)
      @client.set_string(key, value)
    end

    def get_string_list(key)
      @client.get_strv(key)
    end

    def set_string_list(key, list)
      @client.set_strv(key, list.map(&:to_s))
    end
  end
end
