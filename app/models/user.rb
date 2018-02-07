class User < ApplicationRecord
  has_many :messages

  validates :uid, presence: true
  validates :provider, presence: true

  def self.find_or_create_from_auth_hash(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.save!
    end
  end
end
