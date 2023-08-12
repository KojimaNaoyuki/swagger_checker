require 'yaml'
require_relative 'check_case/check_existence'

SWAGGER_FILE_PATH = './test/swagger.yml'

target_api_path = ARGV[0]
target_api_method = ARGV[1]

swagger = YAML.load_file(SWAGGER_FILE_PATH)

check_cases = [
  CheckCase::CheckExistence.new(swagger: swagger, target_api_path: target_api_path, target_api_method: target_api_method)
]

warning_counts = check_cases.map do |check_case|
  check_case.check
  check_case.warning_count
end

if warning_counts.sum == 0
  p 'no warning'
else
  p "#{warning_counts.sum} warnings"
end