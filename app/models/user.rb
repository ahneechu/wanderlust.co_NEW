require 'bcrypt'

class User
	include Mongoid::Document

	attr_accessor :password, :password_confirmation

	field :name, type: String
	
	field :email, type: String
	field :salt, type: String
	field :hashed_password, type: String
	

	before_save :hash_password

	validates :email, presence: true
	validates :email, uniqueness: { case_sensitive: false }
	validates :password, confirmation: true 

	def authenticate(password)
		self.hashed_password ==
		BCrypt::Engine.hash_secret(password, self.salt)
	end


	private
	def hash_password
		if password.present?
			self.salt = BCrypt::Engine.generate_salt
			self.hashed_password = 
			BCrypt::Engine.hash_secret(password, self.salt)
			password = password_confirmation = nil
		end
	end

	has_many :mentors
	has_many :learners
	has_many :skills
end
