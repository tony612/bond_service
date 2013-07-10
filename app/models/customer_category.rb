class CustomerCategory < ActiveRecord::Base
  has_many :customers

  has_many :plan_settings, :dependent => :destroy
  has_many :plans, :through => :plan_settings
end
