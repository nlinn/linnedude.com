class PhotoUploader < Shrine

  plugin :model, cache: false
  plugin :validation_helpers
  plugin :pretty_location

  Attacher.validate do
    validate_max_size 5.megabytes, message: 'is too large (max is 2 MB)'
    validate_mime_type_inclusion ['image/jpg', 'image/jpeg', 'image/png', 'image/gif']
  end

  Attacher.derivatives do |original|
    magick = ImageProcessing::MiniMagick.source(original)

    {
      large:  magick.resize_to_limit!(1200, 1200),
      medium: magick.resize_to_limit!(600, 600),
      small:  magick.resize_to_limit!(200, 200),
      m_square: magick.resize_to_fill!(600, 600),
      s_square: magick.resize_to_fill!(30, 30),
    }
  end

  Attacher.default_url do |derivative: nil, **|
    file&.url if derivative
  end
end

class Shrine::Attacher
  def promote(*)
    create_derivatives
    super
  end
end
