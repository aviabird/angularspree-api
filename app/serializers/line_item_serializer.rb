class LineItemSerializer < BaseSerializer
  attributes *line_item_attributes
  attributes :single_display_amount, :display_amount, :total

  has_many :adjustments, serializer: AdjustmentSerializer
  has_one :variant, serializer: SmallVariantSerializer
end