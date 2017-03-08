class AddressSerializer < BaseSerializer
  attributes *address_attributes

  has_one :country, serializer: CountrySerializer
  has_one :state, serializer: StateSerializer
end