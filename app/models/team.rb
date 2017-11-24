class Team < ApplicationRecord

  belongs_to :club
  belongs_to :season, required: false #TODO: remove
  has_and_belongs_to_many :players
  has_and_belongs_to_many :seasons_tournaments
  has_many :matches, -> (team) { unscope(:where).where('matches.home_team_id = :team_id OR matches.away_team_id = :team_id', team_id: team.id) }
  has_many :goals

end
