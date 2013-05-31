class Comment < ActiveRecord::Base
	attr_accessible :body, :post_id, :post, :user
	belongs_to :user
	belongs_to :post
	has_many :votes, as: :voteable

	validates :body, presence: true
end