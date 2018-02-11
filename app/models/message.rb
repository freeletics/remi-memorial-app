class Message < ApplicationRecord
  # has_one_attached :image
  belongs_to :user
  has_one :image, dependent: :destroy

  validates :content, presence: true
  validates :name, presence: true
  validate :image_signature_validity, if: -> { image_id.present? }

  attr_reader :image_id

  def image_id=(image_id)
    @image_id = image_id
    build_image(external_id: Cloudinary::PreloadedFile.new(image_id).identifier) if image_id.present?
  end

  private

  def image_signature_validity
    if !Cloudinary::PreloadedFile.new(image_id).valid?
      errors.add(:image_id, :invalid)
    end
  end
end
