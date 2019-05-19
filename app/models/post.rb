class Post < ApplicationRecord
  build_friendly_slug :title, use: :database

  has_many_attached :images
  has_rich_text :content

  validates_presence_of :title
  validates_presence_of :category

  enum category: {nielsworkshop: 0}

  before_save :set_published_at, if: :published

  scope :published, -> {
    where(published: true)
  }

  def draft?
    !published
  end

  private

  def set_published_at
    self.published_at = Time.now if self.published_at.nil?
  end

end
