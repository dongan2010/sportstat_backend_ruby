class CreateTournaments < ActiveRecord::Migration[5.0]
  def change
    create_table :tournaments do |t|
      t.references :country
      t.string :name
      t.integer :rank
    end
  end
end
