class TaxonomiesController < ApplicationController
  def index
    @taxonomies = Spree::Taxonomy.order('name').includes(root: :children)

    render json: @taxonomies,
           each_serializer: TaxonomySerializer
  end
end
