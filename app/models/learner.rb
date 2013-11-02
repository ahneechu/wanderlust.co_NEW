class Learner #learning experience
	include Mongoid::Document

#fields to include what to learn
field :notes, type: String

# has_many :agreements
belongs_to :user
# belongs_to :skill
has_and_belongs_to_many :skills



end
