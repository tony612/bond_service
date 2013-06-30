class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :name
      t.text :desc
      t.string :category
      t.text :content

      t.timestamps
    end
  end
end
