# encoding: utf-8
# We're using the carrierwave gem to upload files and Rmagick to process images
class ImageUploader < CarrierWave::Uploader::Base

    include CarrierWave::RMagick
    storage :file

    def store_dir
        "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}" # in fact, it's in public/uploads/...
    end

    # Well, I think you can understand this
    def extension_white_list
        %w(jpg jpeg gif png)
    end

    # create a version a the image where it was resized to fill 800*500px
    version :list do
        resize_to_fill(800,500)
    end

end
