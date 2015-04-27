class CreateTobaccoPricings < ActiveRecord::Migration
  def change
    create_table :tobacco_pricings do |t|
      t.integer :tobacco_brand_id
      t.string :stateOfResidence
      t.float :averagePrice

      t.timestamps null: false
    end
  end
end
