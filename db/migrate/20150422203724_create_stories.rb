class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :image_url
      t.string :body_url
      t.string :summary
      t.string :title
      t.string :source

      t.timestamps null: false
    end
  end
end
