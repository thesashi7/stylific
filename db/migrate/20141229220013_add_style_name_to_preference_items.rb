class AddStyleNameToPreferenceItems < ActiveRecord::Migration
  def change
  	add_column :jackets, :style_name, :string
  	add_column :pants, :style_name, :string
  	add_column :shoes, :style_name, :string
  	add_column :hats, :style_name, :string
  end
end
