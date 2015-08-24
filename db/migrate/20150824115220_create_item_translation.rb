class CreateItemTranslation < ActiveRecord::Migration
  def up
    Item.create_translation_table!({
      title: :string,
      description: :text
    }, {
      migrate_data: true
    })
  end

  def down
    Item.drop_translation_table! migrate_data: true
  end
end
