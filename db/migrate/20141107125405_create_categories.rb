class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      add_reference :auctions, :category, index: true
      
      t.string :name

      t.timestamps
    end
  end
end
