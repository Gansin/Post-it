class User < ActiveRecord::Base
# 1. Rails assumes a table called "users"
# 2. Rails automagically knows table attributes
# 3. Rails gives us getter/setter methods on all attributes
	has_many :posts

# Many to Many
# 1. has_and_belongs_to_many
# 2. has_man through

	has_many :post_categories
	has_many :comments
	has_many :votes


	has_secure_password
	validates :username, presence: true
	validates :username, uniqueness: true
	validates :username, confirmation: true
end
