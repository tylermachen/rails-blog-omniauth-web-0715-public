class User < ActiveRecord::Base
  has_many :posts
  has_many :comments

  def self.create_with_omniauth(auth_hash)
    self.create(name: auth_hash[:info][:name], uid: auth_hash[:uid],
                provider: auth_hash[:provider])
  end
end
