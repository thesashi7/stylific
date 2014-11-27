class RemoveNameFromCustomers < ActiveRecord::Migration

  def change
  	remove_column :customers, :name
  end
end
