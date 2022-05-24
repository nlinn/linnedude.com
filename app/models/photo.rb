class Photo < ApplicationRecord
  include PhotoUploader::Attachment(:file)

  belongs_to :post, optional: true
  belongs_to :photoable, polymorphic: true, optional: true
end
