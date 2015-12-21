class User < ActiveRecord::Base
  searchkick autocomplete: ['name']

  has_attached_file :avatar,
                    # styles: { medium: '180x180>', thumb: '100x100>'},
                    default_url: '/images/:style/missing-avatar.png'
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  has_attached_file :cover,
                     default_url: '/images/:style/missing-cover.jpg'
  validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/


  has_many :posts, dependent: :destroy

  has_many :active_relationships, class_name: 'Relationship',
                                  foreign_key: 'fan_id',
                                  dependent: :destroy
  has_many :idols, through: :active_relationships

  has_many :passive_relationships, class_name: 'Relationship',
                                   foreign_key: 'idol_id',
                                   dependent: :destroy
  has_many :fans, through: :passive_relationships


  has_secure_password

  #Seguir un usuario
  def follow(other_user)
    active_relationships.create(idol_id: other_user.id)
  end
  #Dejar de seguir a un usuario
  def unfollow(other_user)
    active_relationships.find_by(idol_id: other_user.id).destroy
  end
  #Retorna verdad si el usuario actual esta siguiendo a otro usuario
  def following?(other_user)
    idols.include?(other_user)
  end

  def feed
    following_ids = 'SELECT idol_id FROM relationships
                     WHERE  fan_id = :user_id'
    Post.where("user_id IN (#{following_ids})
                     OR user_id = :user_id", user_id: id)
  end
end