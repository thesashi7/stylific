class CreatePants < ActiveRecord::Migration
  def change
    create_table :pants do |t|
      t.integer :price
      t.integer :total_quantity
      t.integer :size
      t.string :type_name
      t.string :company
      t.string :color
      t.string :image_path
      t.string :use_info
      t.string :special_info
      t.string :made_of
      
      t.timestamps
    end
  end
end
