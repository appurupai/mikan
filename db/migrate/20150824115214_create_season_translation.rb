class CreateSeasonTranslation < ActiveRecord::Migration
  def up
    Season.create_translation_table!({
      title: :string,
      notice: :text
    }, {
      migrate_data: true
    })
  end

  def down
    Season.drop_translation_table! migrate_data: true
  end
end
