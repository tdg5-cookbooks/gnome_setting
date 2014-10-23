require 'serverspec'
require 'gnome_setting_helper'

set :backend, :exec

describe 'gnome_setting' do

  describe 'a schema without a path' do

    it 'sets a key with a String datatype' do
      test_setting(GnomeSettingHelper.settings[:schema_without_path_array_of_strings])
    end


    it 'sets a key with an Array<String> datatype' do
      test_setting(GnomeSettingHelper.settings[:schema_without_path_string])
    end

  end


  describe 'a schema with a path' do

    it 'sets a key with a String datatype' do
      test_setting(GnomeSettingHelper.settings[:schema_with_path_string])
    end

  end


  def format_as_serialized_gvariant(value)
    value.inspect.gsub(/"/, "'")
  end


  def test_setting(setting)
    gsetting = Gnome::Setting.new(setting[:user], setting[:schema], setting[:path])
    expected_value = format_as_serialized_gvariant(setting[:value])
    found = gsetting.get(setting[:key], setting[:path])
    expect(found).to eql(expected_value)
  end

end
