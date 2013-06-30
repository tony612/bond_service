class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :fund_account
      t.string :gender
      t.string :id_no
      t.string :address
      t.string :phone
      t.datetime :birthday

      t.timestamps
    end
  end
end
