class Plan < ActiveRecord::Base
  has_many :plan_settings
  has_many :customer_categories, :through => :plan_settings

  validates :name, :presence => true
  validates :content, :presence => true
  def create_retionship_with_customer(category_ids)
    category_ids.each do |cat_id|
      PlanSetting.create!(:plan_id => self.id, :customer_category_id => cat_id)
    end
  end

  def customers
    customer_categories.inject([]) do |cs, cat|
      cs.concat cat.customers
    end
  end
end
