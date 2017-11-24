class Player < ApplicationRecord

  has_and_belongs_to_many :teams#scope by season mb
  has_and_belongs_to_many :matches
  has_many :goals

end