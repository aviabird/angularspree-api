# frozen_string_literal: true

object @product => :data

data_set = params[:data_set] || 'small'

# cache [I18n.locale, @current_user_roles.include?('admin'), current_currency, root_object, 'ng-api']

attribute(:id)
node(:type) { 'products' }

node(:attributes) do |p|
  partial "spree/api/v1/products/ng_#{data_set}_show", object: p
end

if data_set.eql?('large')
  node(:relationships) do |pr|
    {
      master: { data: { type: 'master', id: pr.master.id } },
      variants: {
        data: pr.variants.map { |vr| { type: 'variants', id: vr.id } }
      },
      option_types: {
        data: pr.option_types.map { |ot| { type: 'option_types', id: ot.id } }
      },
      product_properties: {
        data: pr.product_properties.map { |pp| { type: 'product_properties', id: pp.id } }
      },
      classifications: {
        data: pr.classifications.map { |cl| { type: 'classifications', id: cl.id } }
      }
    }
  end

  node :included do |pr|
    {
      master: { data: partial('spree/api/v1/variants/ng_small', object: pr.master) },
      variants: pr.variants.map { |v|
        { data: partial('spree/api/v1/variants/ng_small', object: v) }
      },
      option_types: pr.option_types.map { |ot|
        {
          data: {
            attributes: partial('spree/api/v1/products/ng_option_type', object: ot)
          }
        }
      },
      product_properties: pr.product_properties.map { |pp|
        {
          data: {
            attributes: partial('spree/api/v1/products/ng_product_property', object: pp)
          }
        }
      },
      classifications: pr.classifications.map { |cl|
        {
          data: {
            attributes: partial('spree/api/v1/products/ng_classification', object: cl)
          }
        }
      }
    }
  end
end
