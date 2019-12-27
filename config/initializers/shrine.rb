# guoplawawawaqawsdfgvbnmk987ztred

require "shrine/storage/file_system"

Shrine.storages = { 
  cache: Shrine::Storage::FileSystem.new("public", prefix: "uploads/cache"), # temporary 
  store: Shrine::Storage::FileSystem.new("public", prefix: "uploads"),       # permanent 
}

Shrine.plugin :activerecord 
Shrine.plugin :instrumentation, notifications: ActiveSupport::Notifications
Shrine.plugin :cached_attachment_data # for forms
Shrine.plugin :derivatives
Shrine.plugin :default_url

# require "shrine/storage/s3"

# base_s3_options = {
#   access_key_id: Rails.application.credentials.dig(:aws, :access_key_id),
#   secret_access_key: Rails.application.credentials.dig(:aws, :secret_access_key),
#   region: 'us-east-1',
#   bucket: ENV['SHRINE_S3_BUCKET'],
# }

# cache_s3_options = base_s3_options.merge(
#   prefix: "cache"
# )

# store_s3_options = base_s3_options.merge(
#   public: true,
#   prefix: "store",
#   upload_options: {
#     cache_control: "public, max-age=1209600"
#   }
# )

# Shrine.storages = {
#   cache: Shrine::Storage::S3.new(**cache_s3_options),
#   store: Shrine::Storage::S3.new(**store_s3_options),
# }

# Shrine.plugin :default_url_options, store: { host: ENV['SHRINE_CLOUDFRONT_BASE_URL'] }