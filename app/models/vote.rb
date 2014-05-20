class Vote < ActiveRecord::Base
	module Type
		UPVOTE = 1
		DOWNVOTE = -1
	end

	attr_accessible :category , :micropost_id
	belongs_to :user
	belongs_to :micropost

	validates :user_id, :uniqueness => {:scope => :micropost_id}

	scope :of_upvote_type, :conditions => {:category => Type::UPVOTE}
	scope :of_downvote_type, :conditions => {:category => Type::DOWNVOTE}
end
