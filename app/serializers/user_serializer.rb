class UserSerializer < BaseSerializer
  attributes *(user_attributes | [:bill_address_id, :ship_address_id])

  # has_many :addresses,        serializer: AddressSerializer
  has_many :payment_sources,  serializer: PaymentSourceSerializer
  has_one  :bill_address,     serializer: AddressSerializer
  has_one  :ship_address,     serializer: AddressSerializer

  def payment_sources
    object.credit_cards
  end
end