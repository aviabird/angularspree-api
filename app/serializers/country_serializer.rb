class CountrySerializer < BaseSerializer
  attributes *(country_attributes | [:states_required])

  has_many :states, serializer: StateSerializer
end