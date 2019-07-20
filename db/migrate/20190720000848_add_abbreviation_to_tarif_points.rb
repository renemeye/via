class AddAbbreviationToTarifPoints < ActiveRecord::Migration[5.2]
  def change
    add_column :tarif_points, :abbreviation, :string
  end
end
