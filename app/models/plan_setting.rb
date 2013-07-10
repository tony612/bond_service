class PlanSetting < ActiveRecord::Base
  belongs_to :plan
  belongs_to :customer_category
end
