class Person < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :courses, dependent: :destroy
  include Amistad::FriendModel
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable
end
