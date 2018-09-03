# frozen_string_literal: true

Spree::Image.class_eval do
  include Rails.application.routes.url_helpers

  def styles
    self.class.styles.map do |_, size|
      width, height = size[/(\d+)x(\d+)/].split('x')

      {
        url: polymorphic_path(
          attachment.variant(resize: size, strip: true),
          only_path: true
        ),
        width:  width,
        height: height
      }
    end
  end
end
