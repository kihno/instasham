class Post < ApplicationRecord
  before_create :randomize_id
  
  validates :description, presence: true, length: { minimum: 3, maximum: 500 }

  has_many_attached :images
  belongs_to :user
  has_many :comments
  has_many :likes, as: :likeable

  private

  def randomize_id
    begin
      self.id = SecureRandom.random_number(1_000_000_000)
    end while User.where(id: self.id).exists?
  end
end
