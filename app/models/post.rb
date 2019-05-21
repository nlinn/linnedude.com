class Post < ApplicationRecord

  has_many_attached :images
  has_rich_text :content

  validates_presence_of :title
  validates_presence_of :category

  enum category: {nielsworkshop: 0, notes: 1}

  before_save :set_published_at, if: :published
  before_validation :set_title
  before_validation :set_slug

  scope :published, -> {
    where(published: true)
  }

  def to_param
    slug
  end

  def draft?
    !published
  end

  private

  def set_published_at
    self.published_at = Time.now if self.published_at.nil?
  end

  def set_title
    self.title = Time.now.strftime("%Y-%m-%d-%L") if self.title.blank?
  end

  def set_slug
    self.slug = self.title.parameterize
  end

end
