module Api
  module V1
    class GoalsController < ApplicationController
      def index
        goals = Goal.joins(team: :seasons_tournaments)
        goals = goals.where("teams.club_id = ?", goals_params[:club_id]) if goals_params[:club_id].present?
        goals = goals.where("seasons_tournaments.season_id = ?", goals_params[:season_id]) if goals_params[:season_id].present?
        goals = goals.where("seasons_tournaments.tournament_id = ?", goals_params[:tournament_id]) if goals_params[:tournament_id].present?

        render json: ::Decorators::GoalsDecorator.for_collection.new(goals)
      end

      private

      def goals_params
        params.permit(:club_id, :season_id, :tournament_id)
      end
    end
  end
end
