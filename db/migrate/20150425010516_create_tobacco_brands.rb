class CreateTobaccoBrands < ActiveRecord::Migration
  def change
    create_table :tobacco_brands do |t|
      t.string :name
      t.string :tobaccoType

      t.timestamps null: false
    end
  end
end
