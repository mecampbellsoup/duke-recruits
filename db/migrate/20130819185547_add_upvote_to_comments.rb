class AddUpvoteToComments < ActiveRecord::Migration
  def change
    add_column :comments, :upvote, :integer
  end
end
