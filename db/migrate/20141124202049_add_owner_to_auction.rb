class AddOwnerToAuction < ActiveRecord::Migration
  def change
    add_column :auctions, :owner, :string
  end
end
