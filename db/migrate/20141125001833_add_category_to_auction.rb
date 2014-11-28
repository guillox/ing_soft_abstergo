class AddCategoryToAuction < ActiveRecord::Migration
  def change
    # add_column :auctions, :category, :string
    add_reference :auctions, :category, index: true
  end
end
