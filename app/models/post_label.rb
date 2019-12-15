class PostLabel < ApplicationRecord
  belongs_to :post
  belongs_to :label
  
  validates_presence_of :label
  validates_presence_of :post
  validates_uniqueness_of :label, scope: :post
end