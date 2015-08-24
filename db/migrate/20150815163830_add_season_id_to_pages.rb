class AddSeasonIdToPages < ActiveRecord::Migration
  def change
    add_column :pages, :season_id, :integer
  end
end
