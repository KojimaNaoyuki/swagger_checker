require_relative 'check'

module CheckCase
  class CheckValue < CheckCase::Check
    def check
      print_serious_warning('tagsの命名規則が違います') unless target_schema['tags'][0] == (target_api_path_excluded_version + api_version.capitalize)
    end
  end
end