class CreateSeasons < ActiveRecord::Migration
  def change
    create_table :seasons do |t|
      t.string :title
      t.string :notice

      t.timestamps null: false
    end
  end
end
