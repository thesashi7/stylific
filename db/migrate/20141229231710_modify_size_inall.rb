class ModifySizeInall < ActiveRecord::Migration
  def change
  	remove_column :shoes, :size
  	remove_column :jackets, :size
  	remove_column :pants, :size
  	remove_column :hats, :size

  	add_column :shoes, :size, :string
  	add_column :jackets, :size, :string
  	add_column :pants, :size, :string
  	add_column :hats, :size, :string
  	
  end
end
