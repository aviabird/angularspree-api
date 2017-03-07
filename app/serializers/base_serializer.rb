require "active_model_serializers"

class BaseSerializer < ActiveModel::Serializer
  extend Spree::Api::ApiHelpers
  # cached
  # delegate :cache_key, to: :object
end
