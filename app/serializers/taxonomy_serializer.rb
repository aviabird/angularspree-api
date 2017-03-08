class TaxonomySerializer < BaseSerializer
  attributes *taxonomy_attributes

  has_one :root, embed: :objects,
                 serializer: TaxonSerializer
end