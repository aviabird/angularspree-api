# frozen_string_literal: true

object @product => :data

data_set = params[:data_set] || 'small'

cache [I18n.locale, @current_user_roles.include?('admin'), current_currency, root_object]

attribute(:id)
node(:type) { 'products' }

node(:attributes) do |p|
  partial "spree/api/v1/products/#{data_set}_show", object: p
end

if data_set.eql?('large')
  node(:relationships) do |pr|
    {
      master: { data: { type: 'master', id: pr.master.id } },
      variants: { data: pr.variants.map { |vr| { type: 'variants', id: vr.id } } }
    }
  end

  node :included do |pr|
    {
      master: partial('spree/api/v1/variants/small', object: pr.master),
      variants: pr.variants.map { |v| partial('spree/api/v1/variants/small', object: v) }
    }
  end

end
