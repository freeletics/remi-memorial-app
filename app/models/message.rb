class Message < ApplicationRecord
  belongs_to :user
  has_one :image, dependent: :destroy

  validates :content, presence: true
  validates :name, presence: true
  validate :image_signature_validity, if: -> { image_id.present? }

  attr_reader :image_id

  def image_id=(image_id)
    @image_id = image_id
    build_image(external_id: preloaded_file.identifier) if image_id.present?
  end

  private

  def image_signature_validity
    errors.add(:image_id, :invalid) if !preloaded_file.valid?
  end

  def preloaded_file
    @preloaded_file ||= Cloudinary::PreloadedFile.new(image_id)
  end
end
