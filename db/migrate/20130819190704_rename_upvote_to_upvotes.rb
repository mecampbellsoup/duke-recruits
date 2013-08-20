class RenameUpvoteToUpvotes < ActiveRecord::Migration
  def change
    rename_column :comments, :upvote, :upvotes
  end
end
