class TaxonsController < BaseController
  def show
    @taxon = Spree::Taxon.where(permalink: params[:permalink]).first!

    render json: @taxon, serializer: TaxonSerializer
  end
end
