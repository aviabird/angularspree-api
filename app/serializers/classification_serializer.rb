class ClassificationSerializer < BaseSerializer
  attributes :taxon_id, :position

  has_one :taxon, embed: :objects, serializer: TaxonSerializer
end