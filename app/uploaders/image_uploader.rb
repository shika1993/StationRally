class ImageUploader < CarrierWave::Uploader::Base
  
  
  process :get_exif_info
  def get_exif_info
    exif = EXIFR::JPEG::new(self.file.file).date_time_original.try(:strftime,"'%y %-m %-d %R")
    Timestamp.create(photograph_at: exif, image_id:"")
  end 
  # Include RMagick or MiniMagick support:
    
  include CarrierWave::MiniMagick
  
  process :fix_exif_rotation_and_strip_exif

  def fix_exif_rotation_and_strip_exif
    manipulate! do |img|
      img.auto_orient # よしなに！
      # img.strip       # Exif情報除去
      img = yield(img) if block_given?
      img
    end
  end

  # Choose what kind of storage to use for this uploader:
  storage :fog
  # storage :fog

  #アップロードされたファイルが保存されるディレクトリをオーバーライドします。
  #これは、マウントされることを意図しているアップローダーにとって賢明なデフォルトです：
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url(*args)
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process scale: [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process resize_to_fit: [50, 50]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_whitelist
    %w(jpg jpeg)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

  # ファイルサイズ制限
  def size_range
    1..5.megabytes
  end
end
