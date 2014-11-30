class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      #add_reference :users, :bid, index: true
      #add_reference :auctions, :bid, index: true
      #t.belongs_to :user
      t.belongs_to :auction

      t.text :reason

      t.timestamps
    end
  end
end
