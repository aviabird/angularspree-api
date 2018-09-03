# frozen_string_literal: true

attributes(:slug, :name)

node(:product_url) do |p|
  image = p.master.images.first
  image &&
    main_app.url_for(
      image.attachment.variant(resize: '200x200', strip: true).processed
    )
end

node(:price, &:price)
node(:cost_price) { |p| p.master.cost_price.to_s }
node(:avg_rating, &:avg_rating)
node(:reviews_count, &:reviews_count)
node(:currency) { current_currency }
node(:currency_symbol) do
  Money::Currency.table[current_currency.underscore.to_sym][:symbol]
end
