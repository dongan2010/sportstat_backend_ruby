class Tournament < ApplicationRecord

  belongs_to :country, required: false
  has_many :seasons_tournaments

  validates :transfermarkt_division_name, uniqueness: true

end