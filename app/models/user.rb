class User < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  has_secure_password
end
