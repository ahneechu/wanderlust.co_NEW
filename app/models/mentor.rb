class Mentor #mentoring experience
	include Mongoid::Document

#fields to include what to mentor
field :notes, type: String
# field :courses_description, type: String



# has_many :agreements
belongs_to :user
# belongs_to :skill
has_and_belongs_to_many :skills

end