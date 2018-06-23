data_set = params[:data_set] || 'small'

cache [I18n.locale, @current_user_roles.include?('admin'), 'small_variant', root_object]

node(:attributes) { |v|
  partial 'spree/api/v1/variants/small_attrs', object: v
}

node(:relationships) do |vr|
  {
    option_values: {
      data: vr.option_values.map { |ov| { type: 'option_values', id: ov.id } }
    },
    images: {
      data: vr.images.map { |im| {type: 'images', id: im.id} }
    }
  }
end

node :included do |vr|
  {
    option_values: vr.option_values.map { |im|
      {
        data: {
          attributes: partial('spree/api/v1/variants/option_value', object: im)
        }
      }
    },
    images: vr.images.map { |im|
      {
        data: {
          attributes: partial('spree/api/v1/images/show', object: im)
        }
      }
    }
  }
end
