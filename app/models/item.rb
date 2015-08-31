class Item < ActiveRecord::Base
  translates :title, :description # translated fields
  belongs_to :season
  mount_uploader :image, ImageUploader # use the "image" field to upload files (with carrierwave). See image_uploader.

  def self.to_csv(options = {}) # see controllers/public/exports_controller.rb
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |item|
        csv << item.attributes.values_at(*column_names)
      end
    end
  end
end
