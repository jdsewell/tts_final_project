class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts
  has_many :books
  serialize :following, Array
  serialize :book_list, Array
  serialize :liked_books, Array
  serialize :disliked_books, Array
  validates :username, presence: true, uniqueness: true
end
