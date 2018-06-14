require 'rabl'
require 'oj'

Rabl.configure do |config|
  config.include_json_root = true
  config.include_child_root = false
  config.json_engine = Oj
end
