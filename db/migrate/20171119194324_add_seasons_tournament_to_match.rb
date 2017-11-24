class AddSeasonsTournamentToMatch < ActiveRecord::Migration[5.0]
  def change
    add_reference :matches, :seasons_tournament, foreign_key: true
  end
end
