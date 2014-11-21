class CreateAuctions < ActiveRecord::Migration
  def change
    create_table :auctions do |t|
      t.string :description
      t.string :link

      t.timestamps
    end
  end
end
