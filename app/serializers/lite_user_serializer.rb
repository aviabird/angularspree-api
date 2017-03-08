class LiteUserSerializer < BaseSerializer
  # attributes *user_attributes
  # Correct this implementaion by overriding user_attributes 
  # rather than redefining
  attributes :id, :email, :created_at, :updated_at, :spree_api_key
end
