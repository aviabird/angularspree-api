class CountriesController < BaseController
  def index
    @countries = Spree::Country.includes(:states).order(:name)

    render json: @countries,
           root: false,
           each_serializer: CountrySerializer
  end
end
