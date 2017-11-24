class AddFieldsToTournament < ActiveRecord::Migration[5.0]
  def change
    add_column :tournaments, :transfermarkt_name, :string
    add_column :tournaments, :transfermarkt_division_name, :string
  end
end
