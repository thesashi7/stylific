class EditPreferernceTable < ActiveRecord::Migration

  def change
  	remove_column :preferences, :jacket_id
  	remove_column :preferences, :pant_id
  	remove_column :preferences, :hat_id
  	remove_column :preferences, :shoe_id

  	add_column :preferences, :jackets_ids, :string
  	add_column :preferences, :pants_ids, :string
  	add_column :preferences, :hats_ids, :string
  	add_column :preferences, :shoes_ids, :string
  end
end
