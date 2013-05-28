class Vote < ActiveRecord::Base
# 1. Rails assumes a table called "Votes"
# 2. Rails automagically knows table attributes
# 3. Rails gives us getter/setter methods on all attributes

	belongs_to :user
	# above statement sets up who is doing the voting

# a post can have many votes
# a comment can have many votes

# trying to capture: VOTES can be the "many" side of any parent
	belongs_to :voteable, polymorphic: true
# statement tells computer to go look for two variables, one called votable_type, the other called votable_id


	has_many :posts

# Many to Many
# 1. has_and_belongs_to_many
# 2. has_man through

	has_many :post_categories
	has_many :comments


	has_secure_password
	validates :username, presence: true
end
