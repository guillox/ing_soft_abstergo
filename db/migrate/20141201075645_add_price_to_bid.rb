class AddPriceToBid < ActiveRecord::Migration
  def change
    add_column :bids, :price, :integer
  end
end
