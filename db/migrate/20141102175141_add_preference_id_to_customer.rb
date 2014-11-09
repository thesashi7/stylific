class AddPreferenceIdToCustomer < ActiveRecord::Migration
  def change
    add_column :customers, :preference_id, :integer
  end
end
