class User < ApplicationRecord
	has_many :articles
	before_save { self.email = email.downcase}
	validates :username, length: {minimum: 3, maximum: 25}, uniqueness: {case_sensitive: false}
	validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: { case_sensitive: false}
end