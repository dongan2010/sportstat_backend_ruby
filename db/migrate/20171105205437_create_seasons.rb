class CreateSeasons < ActiveRecord::Migration[5.0]
  def change
    create_table :seasons do |t|
      t.integer :start_year
      t.integer :end_year
      t.integer :season_type
    end
  end
end
