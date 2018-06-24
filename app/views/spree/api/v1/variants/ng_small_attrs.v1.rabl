attributes *variant_attributes

node(:display_price) { |p| p.display_price.to_s }
node(:options_text, &:options_text)
node(:track_inventory, &:should_track_inventory?)
node(:in_stock, &:in_stock?)
node(:is_backorderable, &:is_backorderable?)
node(:is_orderable) { |v| v.is_backorderable? || v.in_stock? }
node(:total_on_hand, &:total_on_hand)
node(:is_destroyed, &:destroyed?)
node(:cost_price) { |p| p.cost_price.to_s }

