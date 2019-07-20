class CreateTarifPoints < ActiveRecord::Migration[5.2]
  def change
    create_table :tarif_points do |t|
      t.string :name
      t.integer :ibnr
      t.string :status
      t.string :network
      t.string :regions
      t.boolean :equality_treatments

      t.timestamps
    end
  end
end
