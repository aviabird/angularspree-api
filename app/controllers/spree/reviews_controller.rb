# frozen_string_literal: true
class Spree::ReviewsController < Spree::StoreController
  helper Spree::BaseHelper
  before_action :load_product, only: %i[index new create]
  rescue_from ActiveRecord::RecordNotFound, with: :render_404

  def index
    @approved_reviews = Spree::Review.approved.where(product: @product)
    ratings_array = @approved_reviews.pluck(:rating)
    total_ratings = @approved_reviews.count
    rating_summery = calculate_reviews(ratings_array)

    render json: {
      reviews: @approved_reviews,
      rating_summery: rating_summery,
      total_ratings: total_ratings
    }
  end

  def new
    @review = Spree::Review.new(product: @product)
  end

  def create
    params[:review][:rating].sub!(/\s*[^0-9]*\z/, '') unless params[:review][:rating].blank?
    product_reviews = Spree::Review.where(product_id: params[:product_id])
    if (!is_already_reviewed(product_reviews)) 
      @review = Spree::Review.new(review_params)
      @review.product = @product
      @review.user = Spree::User.find_by(id: params[:review][:user_id])
      @review.ip_address = request.remote_ip
      @review.locale = I18n.locale.to_s if Spree::Reviews::Config[:track_locale]

      if @review.save
        message = Spree.t(:review_successfully_submitted)
        render json: { type: :success, message: message }
      else
        message = 'Unable to submit the review'
        render json: { type: :error, message: message }
      end

    else 
      message = 'You have already reviewed this product'
      render json: { type: :info, message: message }
    end
  end

  private

  def load_product
    @product = Spree::Product.friendly.find(params[:product_id])
  end

  def permitted_review_attributes
    %i[rating title review name show_identifier]
  end

  def review_params
    params.require(:review).permit(permitted_review_attributes)
  end

  def calculate_reviews(ratings_array)
    counts = Hash.new 0
    ratings_array.each do |rate|
      counts[rate] += 1
    end

    for i in 1..5
      counts.merge!(i => 0) if counts[i]==0 
    end

    @rating_summery = []
    sorted_counts = counts.sort_by {|k,v| k}.reverse
    sorted_counts.each do |key, value|
      @rating_summery << { 'rating'=> key, 'count'=>value, 'percentage' => (value.to_f / ratings_array.count * 100) }
    end
    @rating_summery
  end

  def is_already_reviewed(product_reviews)
    user_id = params[:review][:user_id]
    product_reviews.find { |r| r.user_id == user_id } ? true : false
  end   

end
