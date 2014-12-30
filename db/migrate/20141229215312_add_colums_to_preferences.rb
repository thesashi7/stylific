class AddColumsToPreferences < ActiveRecord::Migration
  def change
  	add_column :preferences, :main_style, :string
  	add_column :preferences, :jacket_id, :integer
  	add_column :preferences, :shoe_id, :integer
  	add_column :preferences, :hat_id, :integer
  	add_column :preferences, :pant_id, :integer
  end
end
