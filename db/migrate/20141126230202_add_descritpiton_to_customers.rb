class AddDescritpitonToCustomers < ActiveRecord::Migration
  def change
  	add_column :customers, :description, :string
  end
end
