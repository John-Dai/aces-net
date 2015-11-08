class Person < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :email, presence: true, uniqueness: true
  validates :password, length: { in: 8..72 }
  has_many :courses, dependent: :destroy
  include Amistad::FriendModel
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable
end
