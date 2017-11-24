class CreateJoinTableMatchesPlayers < ActiveRecord::Migration[5.0]
  def change
    create_join_table :matches, :players do |t|
      t.references :match, foreign_key: true
      t.references :player, foreign_key: true
    end
  end
end
