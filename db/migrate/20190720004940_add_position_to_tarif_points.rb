class AddPositionToTarifPoints < ActiveRecord::Migration[5.2]
  def change
    add_column :tarif_points, :eva_nr, :integer
    add_column :tarif_points, :ds100, :string
    add_column :tarif_points, :dhid, :string
    add_column :tarif_points, :latitude, :float
    add_column :tarif_points, :longitude, :float
  end
end
