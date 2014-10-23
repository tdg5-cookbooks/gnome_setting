require 'serverspec'
require 'gnome_setting_helper'

set :backend, :exec

describe 'gnome_setting' do

  it 'sets all settings correctly' do
    GnomeSettingHelper.settings.each do |name, setting|
      gsetting = Gnome::Setting.new(setting[:user], setting[:schema], setting[:path])
      expected_value = format_as_serialized_gvariant(setting[:value])
      value_found = gsetting.get(setting[:key], setting[:path])
      expect(value_found).to eql(expected_value)
    end
  end

  def format_as_serialized_gvariant(value)
    value.inspect.gsub(/"/, "'")
  end

end
