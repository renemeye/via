class CreatePlusCityZones < ActiveRecord::Migration[5.2]
  def change
    create_table :plus_city_zones do |t|
      t.string :dtzid
      t.string :city_name

      t.timestamps
    end
  end
end
