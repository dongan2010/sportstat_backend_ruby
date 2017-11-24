class Goal < ApplicationRecord

  belongs_to :team
  belongs_to :match, required: false #TODO: remove
  belongs_to :player, required: false #TODO: remove

end
