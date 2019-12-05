class Article < ApplicationRecord 
	belongs_to :user
	has_many :article_categories
	has_many :categories, through: :article_categories

	validates :user_id , presence: true
	validates :title, presence: true, length: {minimum:3 , maximum: 40}
	validates :description, presence: true, length: {minimum:8 , maximum: 1000}
end