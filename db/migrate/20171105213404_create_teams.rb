class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.references :club, foreign_key: true
      t.references :season, foreign_key: true
    end
  end
end
