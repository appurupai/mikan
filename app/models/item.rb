class Item < ActiveRecord::Base
  translates :title, :description # translated fields
  belongs_to :season
  mount_uploader :image, ImageUploader # use the "image" field to upload files (with carrierwave). See image_uploader.
end
