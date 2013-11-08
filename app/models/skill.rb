class Skill
	include Mongoid::Document

	attr_accessor :m_or_l, :notes, :bio, :objectives, :goals

	field :skill_name, type: String
	field :skill_description, type: String

	
	
	has_and_belongs_to_many :learners, dependent: :destroy
	has_and_belongs_to_many :mentors, dependent: :destroy
	# has_many :learners
	# has_many :mentors
	belongs_to :category


end