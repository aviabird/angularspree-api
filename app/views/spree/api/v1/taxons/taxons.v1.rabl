attributes *taxon_attributes

node :taxons do |t|
  t.children.map { |c| partial('spree/api/v1/taxons/taxons', object: c).merge(icon: c.icon&.attachment(:normal)) }
end
