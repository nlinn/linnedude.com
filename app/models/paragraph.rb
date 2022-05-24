class Paragraph < ApplicationRecord

  has_many :photos, as: :photoable, dependent: :destroy
  accepts_nested_attributes_for :photos, allow_destroy: true

  belongs_to :post

  validates_presence_of :position
  validates_uniqueness_of :position, scope: :post

  before_validation :set_position

  scope :sorted, -> { order(position: :asc) }

  def first?
    self == post.paragraphs.sorted.first
  end

  private

  def set_position
    if position.nil?
      self.position = (Paragraph.where(post: post).maximum(:position) || 0) + 1
    end
  end
end
