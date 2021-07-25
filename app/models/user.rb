class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :profile_image
  has_many :books, dependent: :destroy

  validates :name, presence: true,
  length: { minimum: 2, maximum: 20 },
  uniqueness: true

  validates :introduction,
  length: { maximum: 50 }

end
