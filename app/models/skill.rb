class Skill
	include Mongoid::Document

	field :skill_name, type: String
	field :skill_description, type: String


	has_many :learners
	has_many :mentors
	belongs_to :category


end