class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :notes, dependent: :destroy

  has_many :relationships, dependent: :destroy, foreign_key: :follower_id
  has_many :followed_users, through: :relationships, source: :following

  has_many :inverse_relationships, foreign_key: :following_id, class_name: "Relationship"
  has_many :followers, through: :inverse_relationships

  def follow! user
    relationships.create! following: user
  end

  def follows? user
    followed_users.include? user
  end
end
