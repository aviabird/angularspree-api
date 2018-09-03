# frozen_string_literal: true

object @image
attributes(*image_attributes)
attributes :viewable_type, :viewable_id
Spree::Image.styles.each do |k, v|
  node("#{k}_url") do |i|
    main_app.url_for(
      i.attachment.variant(resize: v, strip: true).processed
    )
  end
end
