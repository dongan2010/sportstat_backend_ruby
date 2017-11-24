class CreateSeasonsTournaments < ActiveRecord::Migration[5.0]
  def change
    create_table :seasons_tournaments do |t|
      t.integer :season_id
      t.integer :tournament_id
    end
  end
end
