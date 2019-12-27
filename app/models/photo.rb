class Photo < ApplicationRecord
  include PhotoUploader::Attachment(:file)

  belongs_to :post
end