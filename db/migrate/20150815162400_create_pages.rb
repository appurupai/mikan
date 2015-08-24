class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.text :content
      t.boolean :alert

      t.timestamps null: false
    end
  end
end
