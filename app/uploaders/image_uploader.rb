class ImageUploader < CarrierWave::Uploader::Base
    include CarrierWave::RMagick

    storage :file

    def store_dir
        "uploads/#{model.class.to_s.underscore}/#{model.id}"
    end

    version :normal do
        process resize_to_fill: [450, 450]
    end

    version :medium do
        process resize_to_fill: [250, 250]
    end

    version :small do
        process resize_to_fill: [150, 150]
    end

    def extension_white_list
        %w(jpg jpeg png)
    end
end
