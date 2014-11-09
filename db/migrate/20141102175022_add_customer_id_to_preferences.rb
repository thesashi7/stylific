class AddCustomerIdToPreferences < ActiveRecord::Migration
  def change
    add_column :preferences, :customer_id, :integer
  end
end
