# frozen_string_literal: true

object @product => :data

cache [I18n.locale, @current_user_roles.include?('admin'), current_currency, root_object]

attribute(:id)
node(:type) { 'products' }

node(:attributes) do |p|
  partial "spree/api/v1/products/#{params[:data_set]}_show", object: p
end

if params[:data_set].eql?('large')
  node(:relationships) do |pr|
    {
      master: { data: { type: 'master', id: pr.master.id } },
      variants: { data: pr.variants.map { |vr| { type: 'variants', id: vr.id } } }
    }
  end

  child(@product => :included) do
    child master: :master do
      extends 'spree/api/v1/variants/small'
    end

    child variants: :variants do
      extends 'spree/api/v1/variants/small'
    end
  end
end
