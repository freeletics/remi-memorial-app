class User < ApplicationRecord
  has_many :messages

  validates :uid, presence: true
  validates :provider, presence: true

  def self.find_or_create_from_auth_hash(auth)
    find_or_create_by(provider: auth.provider, uid: auth.uid) do |user|
      user.name = auth.info.name
    end
  end
end
