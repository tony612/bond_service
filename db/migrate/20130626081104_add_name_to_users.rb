class AddNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :desc, :text
    add_column :users, :number, :integer
  end
end
