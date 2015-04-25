class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.datetime :birthdate
      t.string :stateOfResidence
      t.integer :cigarettesPerDay
      t.integer :dipsPerDay
      t.integer :cigarsPerDay
      t.integer :cigaretteBrandId
      t.integer :dipBrandId
      t.integer :cigarBrandId
      t.string :email
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
