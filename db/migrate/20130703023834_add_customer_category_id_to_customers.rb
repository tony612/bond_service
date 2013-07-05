class AddCustomerCategoryIdToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :customer_category_id, :integer
  end
end
