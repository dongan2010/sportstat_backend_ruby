module Api
  module V1
    class TournamentsController < ApplicationController

      def index
        tournaments = Tournament.first(5)
        render json: ::Decorators::TournamentsDecorator.for_collection.new(tournaments)
      end

    end
  end
end
