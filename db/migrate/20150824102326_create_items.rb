class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.string :image
      t.text :description
      t.string :hummingbird_url
      t.string :official_url
      t.date :airing_from
      t.integer :season_id
      t.string :category

      t.timestamps null: false
    end
  end
end
