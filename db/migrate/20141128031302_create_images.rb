class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      add_reference :auctions, :image
      t.string :image_uid
      t.string :image_name  # Optional - if you want urls
                            # to end with the original filename

      t.timestamps
    end
  end
end
