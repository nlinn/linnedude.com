class Label < ApplicationRecord
  has_many :post_labels
  has_many :posts, through: :post_labels

  scope :sorted, -> { order(sort: :desc).order(name: :asc) }
  scope :is_public, -> { where(public: true) }

  validates_uniqueness_of :name, case_sensitive: false
  validates_presence_of :name
  validates_presence_of :slug
  validates_uniqueness_of :slug

  before_validation :set_slug

  def set_slug
    self.slug = self.name.parameterize
  end
end
