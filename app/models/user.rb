class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :profile_image
  has_many :books, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :name, presence: true,
  length: { minimum: 2, maximum: 20 },
  uniqueness: true

  validates :introduction,
  length: { maximum: 50 }


  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :reverse_of_relationships, source: :follower
  # 被フォロー関係を通じて参照→followed_idをフォローしている人

  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  # 【class_name: "Relationship"】は省略可能
  has_many :followings, through: :relationships, source: :followed

  def follow(user_id)
   relationships.create(followed_id: user_id)
  end
  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destroy
  end
  def following?(user)
    followings.include?(user)
  end

  def self.search(search,word)
          if search == "forward_match"
                            @user = User.where("name LIKE?","#{word}%")
          elsif search == "backward_match"
                            @user = User.where("name LIKE?","%#{word}")
          elsif search == "perfect_match"
                            @user = User.where("#{word}")
          elsif search == "partial_match"
                            @user = User.where("name LIKE?","%#{word}%")
          else
                            @user = User.all
          end

 end

end
