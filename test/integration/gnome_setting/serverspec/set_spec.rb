require 'serverspec'
require 'gnome_setting_helper'

set :backend, :exec

describe 'gnome_setting' do

  describe 'a schema without a path' do

    it 'sets a key with a Boolean datatype' do
      test_setting(GnomeSettingHelper.settings[:schema_without_path_boolean])
    end


    it 'sets a key with a Float datatype' do
      test_setting(GnomeSettingHelper.settings[:schema_without_path_float])
    end


    it 'sets a key with a Integer datatype' do
      test_setting(GnomeSettingHelper.settings[:schema_without_path_integer])
    end


    it 'sets a key with a String datatype' do
      test_setting(GnomeSettingHelper.settings[:schema_without_path_string])
    end


    it 'sets a key with a String datatype containing quotes' do
      test_setting(GnomeSettingHelper.settings[:schema_without_path_string_with_quotes])
    end


    it 'sets a key with an Array<String> datatype' do
      test_setting(GnomeSettingHelper.settings[:schema_without_path_array_of_strings])
    end

  end


  describe 'a schema with a path' do

    it 'sets a key with a String datatype' do
      test_setting(GnomeSettingHelper.settings[:schema_with_path_string])
    end

  end


  def test_setting(setting)
    gsetting = Gnome::Setting.new(setting[:user], setting[:schema], setting[:path])
    expected_value = Gnome::Setting.dump_value_as_serialized_gvariant(setting[:value])
    found = gsetting.get(setting[:key])
    expect(found).to eql(expected_value)
  end

end
