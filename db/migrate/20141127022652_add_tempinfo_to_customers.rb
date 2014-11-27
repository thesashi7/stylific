class AddTempinfoToCustomers < ActiveRecord::Migration
  def change
  	add_column :customers, :tempInfo, :string
  end
end
