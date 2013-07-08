class CreatePlanSettings < ActiveRecord::Migration
  def change
    create_table :plan_settings do |t|
      t.integer :plan_id
      t.integer :customer_category_id

      t.timestamps
    end
  end
end
