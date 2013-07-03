class CreateCustomerCategories < ActiveRecord::Migration
  def change
    create_table :customer_categories do |t|
      t.string :name
      t.text :desc

      t.timestamps
    end
  end
end
