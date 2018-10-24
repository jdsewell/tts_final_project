class Book < ApplicationRecord
	has_many :users
	validates :title, presence: true, uniqueness: true
	validates :author, presence: true
end
