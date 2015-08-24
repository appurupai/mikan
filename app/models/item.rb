class Item < ActiveRecord::Base
  translates :title, :description
  belongs_to :season
  mount_uploader :image, ImageUploader
end
