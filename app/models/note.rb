class Note < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :user

  validates :title, :content, presence: true
  validates :title, uniqueness: true
end
