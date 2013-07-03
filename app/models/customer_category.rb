class CustomerCategory < ActiveRecord::Base
  has_many :customers
end
