class Post < ActiveRecord::Base
  belongs_to :user
  default_scope -> {order(created_at: :desc)}
  has_many :pictures
end
