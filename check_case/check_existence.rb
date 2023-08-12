require_relative 'check'

module CheckCase
  class CheckExistence < CheckCase::Check
    def check
      print_serious_warning('descriptionが存在しません') if target_schema['description'].nil?
      print_serious_warning('tagsが存在しません') if target_schema['tags'].nil?
    end
  end
end