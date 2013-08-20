class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  #scope :sorted_comments, order('upvotes')
end
