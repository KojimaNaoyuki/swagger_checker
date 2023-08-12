module CheckCase
  class Check
    attr_reader :target_schema
    attr_reader :warning_count
  
    def initialize(swagger:, target_api_path:, target_api_method:)
      @target_schema = swagger['paths']["#{target_api_path}"]["#{target_api_method}"]
      @warning_count = 0
    end
  
    def check
     
    end

    def print_serious_warning(text)
      @warning_count += 1
      
      p "serious warning: #{text}"
    end
  end
end