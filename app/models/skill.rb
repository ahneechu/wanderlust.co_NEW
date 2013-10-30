class Skill
	include Mongoid::Document

	field :skill_name, type: String
	field :skill_description, type: String

	
	#this is to concatnate category and skill names
	# def to_s
	# 	self.category_name + ' & ' + self.skill_name
	# end


	has_many :learners
	has_many :mentors
	belongs_to :category


end