module CheckCase
  class Check
    attr_reader :target_schema
    attr_reader :warning_count

    attr_reader :target_api_path
    attr_reader :target_api_method

    API_VERSION_SECTION_NUM = 1
  
    def initialize(swagger:, target_api_path:, target_api_method:)
      @target_schema = swagger['paths']["#{target_api_path}"]["#{target_api_method}"]
      @target_api_path = target_api_path
      @target_api_method = target_api_method
      @warning_count = 0
    end
  
    def check
     
    end

    def api_version
      target_api_path.split('/')[API_VERSION_SECTION_NUM]
    end

    def target_api_path_excluded_version
      target_api_path.delete("/#{api_version}/")
    end

    def print_serious_warning(text)
      @warning_count += 1
      
      p "serious warning: #{text}"
    end
  end
end