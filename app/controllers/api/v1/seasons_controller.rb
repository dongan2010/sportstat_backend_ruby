module Api
  module V1
    class SeasonsController < ApplicationController

      def index
        seasons = Season.all
        render json: ::Decorators::SeasonsDecorator.for_collection.new(seasons)
      end

    end
  end
end
