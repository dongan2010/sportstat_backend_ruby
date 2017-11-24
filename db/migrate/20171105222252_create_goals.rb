class CreateGoals < ActiveRecord::Migration[5.0]
  def change
    create_table :goals do |t|
      t.references :team, foreign_key: true
      t.integer :minute
      t.references :match, foreign_key: true
    end
  end
end
