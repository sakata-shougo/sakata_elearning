class User < ApplicationRecord
  before_save { email.downcase! }

  validates :name, presence: true, length: { minimum: 3, maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { minimum: 3, maximum: 65 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, length: { minimum: 3 },allow_nil:true

  mount_uploader :avatar, AvatarUploader

  has_many :active_relationships, class_name: "Relationship",
              foreign_key: "follower_id",
              dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed

  has_many :passive_relationships, class_name: "Relationship",
              foreign_key: "followed_id",
              dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower

  has_many :lessons,dependent: :destroy

  has_many :activities, dependent: :destroy

  def active_relationships
    Relationship.where(follower_id: id)
    # follower_id = id
end

def passive_relationships
    Relationship.where(followed_id: id)
end

def follow(other_user)
    Relationship.create(
      follower_id: id,
      followed_id: other_user.id
    )
end

def relationship(other_user)
  active_relationships.find_by(
    followed_id: other_user.id
  )
end

def lesson_taken(cat_id)
    lesson = lessons.find_by(category_id: cat_id)
end
end