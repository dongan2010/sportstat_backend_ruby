class SeasonsTournament < ApplicationRecord

  belongs_to :season
  belongs_to :tournament
  has_and_belongs_to_many :teams
  has_many :matches

end