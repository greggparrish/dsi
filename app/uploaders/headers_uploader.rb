class HeadersUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url
    ActionController::Base.helpers.asset_path("fallback/" + [version_name, "userimage_default.jpg"].compact.join('_'))
  end

  process resize_to_fill: [1200, 300]

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

end

