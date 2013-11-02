class Skill
	include Mongoid::Document

	attr_accessor :m_or_l, :notes, :bio, :objectives, :goals

	field :skill_name, type: String
	field :skill_description, type: String

	
	#this is to concatnate category and skill names
	# def to_s
	# 	self.category_name + ' & ' + self.skill_name
	# end

	has_and_belongs_to_many :learners
	has_and_belongs_to_many :mentors
	# has_many :learners
	# has_many :mentors
	belongs_to :category


end