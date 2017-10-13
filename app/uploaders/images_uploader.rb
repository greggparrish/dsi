class ImagesUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url
    ActionController::Base.helpers.asset_path("fallback/" + [version_name, "userimage_default.jpg"].compact.join('_'))
  end

  # process scale: [200, 300]
  version :sq_thumb do
    process resize_to_fill: [350, 350]
  end

  version :rect_thumb do
    process resize_to_fill: [350, 175]
  end

  version :lg_square do
    process resize_to_fill: [500,500]
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

end

