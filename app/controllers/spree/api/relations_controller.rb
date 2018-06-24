# frozen_string_literal: true

module Spree
  module Api
    class RelationsController < Spree::Api::BaseController
      before_action :load_data, only: %i[create destroy]
      before_action :find_relation, only: %i[update destroy]

      def index
        @product = Spree::Product.friendly.find(params[:product_id])
        @products = Product.where(id: @product.relations.pluck(:related_to_id))
                                  .page(params[:page])
                                  .per(params[:per_page])
        respond_with(@products, template: 'spree/api/v1/products/index')
      end

      def create
        authorize! :create, Relation
        @relation = @product.relations.new(relation_params)
        @relation.relatable = @product
        @relation.related_to = Spree::Variant.find(relation_params[:related_to_id]).product
        if @relation.save
          respond_with(@relation, status: 201, default_template: :show)
        else
          invalid_resource!(@relation)
        end
      end

      def update
        authorize! :update, Relation
        if @relation.update_attributes(relation_params)
          respond_with(@relation, status: 200, default_template: :show)
        else
          invalid_resource!(@relation)
        end
      end

      def update_positions
        authorize! :update, Relation
        params[:positions].each do |id, index|
          model_class.where(id: id).update_all(position: index)
        end

        respond_to do |format|
          format.json { head :ok }
          format.js { render plain: 'Ok' }
        end
      end

      def destroy
        authorize! :destroy, Relation
        @relation.destroy
        respond_with(@relation, status: 204)
      end

      private

      def relation_params
        params.require(:relation).permit(*permitted_attributes)
      end

      def permitted_attributes
        %i[
          related_to
          relation_type
          relatable
          related_to_id
          discount_amount
          relation_type_id
          related_to_type
          position
        ]
      end

      def load_data
        @product = Spree::Product.friendly.find(params[:product_id])
      end

      def find_relation
        @relation = Relation.find(params[:id])
      end

      def model_class
        Spree::Relation
      end
    end
  end
end
