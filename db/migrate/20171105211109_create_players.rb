class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.references :team
      t.date :born_date
    end
  end
end
