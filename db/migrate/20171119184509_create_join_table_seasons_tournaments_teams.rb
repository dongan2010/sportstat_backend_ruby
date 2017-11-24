class CreateJoinTableSeasonsTournamentsTeams < ActiveRecord::Migration[5.0]
  def change
    create_join_table :teams, :seasons_tournaments do |t|
      # t.index [:team_id, :tournamets_season_id]
      t.references :seasons_tournaments, foreign_key: true
    end
  end
end
