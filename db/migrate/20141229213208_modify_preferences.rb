class ModifyPreferences < ActiveRecord::Migration
  def change
  	remove_column :preferences, :size
  	remove_column :preferences, :shoeSize
  	remove_column :preferences, :height
  	remove_column :preferences, :primaryStyle
  	remove_column :preferences, :secondaryStyle
  end
end
