class LiteLineItemSerializer < BaseSerializer
  attributes :single_display_amount, :display_amount, :total, :image_url

  def image_url
  	object.variant.images.first.attachment.url('small')
  end
end