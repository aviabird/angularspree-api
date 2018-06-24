attributes :taxon_id, :position

child(:taxon) do
  extends 'spree/api/v1/taxons/show'
end
