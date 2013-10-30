class Category
	include Mongoid::Document

field :category_name, type: String

has_many :skills

end