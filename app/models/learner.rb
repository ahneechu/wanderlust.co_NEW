class Learner #learning experience
	include Mongoid::Document

#fields to include what to learn
field :notes, type: String
field :objectives, type: String
field :goals, type: String


# has_many :agreements
belongs_to :user
belongs_to :skill



end
