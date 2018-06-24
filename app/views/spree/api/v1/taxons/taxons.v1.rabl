# frozen_string_literal: true

attributes(*taxon_attributes)

node :taxons do |t|
  t.children.map do |c|
    partial('spree/api/v1/taxons/taxons', object: c)
      .merge(icon: c.icon&.attachment && main_app.url_for(c.icon&.attachment))
  end
end
