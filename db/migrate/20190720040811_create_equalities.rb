class CreateEqualities < ActiveRecord::Migration[5.2]
  def change
    create_table :equalities do |t|
      t.string :tarif_point_name
      t.integer :ibnr
      t.string :equality_type
      t.integer :min_km
      t.string :price_forming_tarif_point_name
      t.integer :price_forming_tarif_point_ibnr
      t.string :collective_name

      t.timestamps
    end
  end
end
