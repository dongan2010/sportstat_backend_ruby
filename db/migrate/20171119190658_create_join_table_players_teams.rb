class CreateJoinTablePlayersTeams < ActiveRecord::Migration[5.0]
  def change
    create_join_table :players, :teams do |t|
      t.references :player, foreign_key: true
      t.references :team, foreign_key: true
    end
  end
end
