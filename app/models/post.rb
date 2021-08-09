class Post < ApplicationRecord

  has_many :photos, dependent: :destroy
  accepts_nested_attributes_for :photos, allow_destroy: true

  has_many_attached :images
  has_rich_text :content

  has_many :post_labels
  has_many :labels, through: :post_labels

  #validates_presence_of :title
  validates_presence_of :category
  validates_presence_of :slug
  validates_uniqueness_of :slug
  validates_presence_of :design

  before_save :set_published_at, if: :published
  #before_validation :set_title
  before_validation :set_slug, on: :create

  scope :published, -> { where(published: true) }
  scope :sorted, -> { order(published_at: :desc) }

  def to_param
    slug
  end

  def draft?
    !published
  end

  def highest_prio_label_with_description
    @highest_prio_label_with_description ||= labels.sorted.is_public.with_description.first
  end

  private

  def set_published_at
    self.published_at = Time.now if self.published_at.nil?
  end

  def set_title
    self.title = Time.now.strftime("%Y-%m-%d-%L") if self.title.blank?
  end

  def set_slug
    self.slug = SecureRandom.urlsafe_base64(6) if self.slug.blank?
  end
end
