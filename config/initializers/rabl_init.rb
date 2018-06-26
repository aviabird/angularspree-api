require 'rabl'
require 'oj'

Rabl.configure do |config|
  config.json_engine = Oj
end
