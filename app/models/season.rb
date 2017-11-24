class Season < ApplicationRecord

  has_many :teams
  has_many :seasons_tournaments

end
