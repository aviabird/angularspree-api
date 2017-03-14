class ShippingMethodSerializer < BaseSerializer
  attributes :id, :code, :name

  has_many :shipping_categories,
           serializer: ShippingCategorySerializer
  has_many :zones, serializer: ZoneSerializer
end