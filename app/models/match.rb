class Match < ApplicationRecord

  has_many :goals, dependent: :destroy

  belongs_to :home_team, foreign_key: 'home_team_id', class_name: 'Team'
  belongs_to :away_team, foreign_key: 'away_team_id', class_name: 'Team'
  belongs_to :seasons_tournament

  has_and_belongs_to_many :players

end
