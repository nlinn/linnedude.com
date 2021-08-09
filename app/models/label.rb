class Label < ApplicationRecord
  has_many :post_labels
  has_many :posts, through: :post_labels
  has_rich_text :description

  scope :sorted, -> { order(sort: :desc).order(name: :asc) }
  scope :is_public, -> { where(public: true) }
  scope :with_description, -> { joins(:rich_text_description).where.not(rich_text_description: {id: nil}) }

  validates_uniqueness_of :name, case_sensitive: false
  validates_presence_of :name
  validates_presence_of :slug
  validates_uniqueness_of :slug

  before_validation :set_slug

  def set_slug
    self.slug = self.name.parameterize
  end
end
