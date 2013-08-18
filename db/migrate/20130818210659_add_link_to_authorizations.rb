class AddLinkToAuthorizations < ActiveRecord::Migration
  def change
    add_column :authorizations, :link, :string
  end
end
