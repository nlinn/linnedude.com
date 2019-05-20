class Post < ApplicationRecord
  build_friendly_slug :title, use: :database

  has_many_attached :images
  has_rich_text :content

  validates_presence_of :title
  validates_presence_of :category

  enum category: {nielsworkshop: 0, notes: 1}

  #before_save :set_published_at, if: :published
  #before_validation :set_title

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

  def set_title
    self.title = Time.now.strftime("%Y-%m-%d-%L") if self.title.blank?
  end

end
