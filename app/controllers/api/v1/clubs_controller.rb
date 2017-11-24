module Api
  module V1
    class ClubsController < ApplicationController

      def index
        clubs = Club.joins(teams: :seasons_tournaments)
        clubs = clubs.where("seasons_tournaments.tournament_id = ?", params[:tournament_id]) if params[:tournament_id].present?
        clubs = clubs.where("seasons_tournaments.season_id = ?", params[:season_id]) if params[:season_id].present?

        render json: ::Decorators::ClubsDecorator.for_collection.new(clubs)
      end

      private

      def clubs_params
        params.permit(:tournament_id, :season_id)
      end

    end
  end
end
