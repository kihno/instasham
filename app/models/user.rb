class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  before_create :randomize_id, :attach_default_avatar

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  has_many :posts
  has_many :comments
  has_many :likes

  has_many :followed_users, foreign_key: :follower_id, class_name: 'Follow'
  has_many :following, through: :followed_users
  has_many :following_users, foreign_key: :following_id, class_name: 'Follow'
  has_many :followers, through: :following_users

  private

  def randomize_id
    begin
      self.id = SecureRandom.random_number(1_000_000_000)
    end while User.where(id: self.id).exists?
  end

  def attach_default_avatar
    self.avatar = "/assets/images/Default_pfp.png"
  end
end
