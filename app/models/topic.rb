class Topic < ApplicationRecord
    has_many :posts
    has_many :posts, dependent: :destroy
		has_many :sponsered_posts
end
