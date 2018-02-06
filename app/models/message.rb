class Message < ApplicationRecord
  has_one_attached :image

  validates :content, presence: true
end
