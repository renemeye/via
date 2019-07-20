class CreateTarifDistances < ActiveRecord::Migration[5.2]
  def change
    create_table :tarif_distances do |t|
      t.string :from_name
      t.integer :from_ibnr
      t.string :to_name
      t.integer :to_ibnr
      t.integer :tarif_kilometer
      t.boolean :bus
      t.boolean :around
      t.boolean :exclusion_way
      t.string :region

      t.timestamps
    end
  end
end
