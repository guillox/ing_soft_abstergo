class AddActivoToUser < ActiveRecord::Migration
  def change
    add_column :users, :activo, :boolean
  end
end
