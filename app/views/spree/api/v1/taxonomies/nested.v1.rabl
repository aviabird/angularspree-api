# frozen_string_literal: true

attributes(*taxonomy_attributes)

child root: :root do
  attributes(*taxon_attributes)

  child children: :taxons do
    node(:icon) { |p| p.icon&.attachment && main_app.url_for(p.icon&.attachment) }
    attributes(*taxon_attributes)
    extends 'spree/api/v1/taxons/taxons'
  end
end
