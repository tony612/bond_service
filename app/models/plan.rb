class Plan < ActiveRecord::Base
  VALID_HEADER = %w{name category desc content}

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

  def self.import(file)
    excel = open_excel(file)
    header = excel.row(1)
    (2..excel.last_row).each do |i|
      row = Hash[[header, excel.row(i)].transpose]
      row.delete_if { |k, v| !VALID_HEADER.include?(k) }
      Plan.create!(row)
    end
  end

  def self.open_excel(file)
    case File.extname(file.original_filename)
    when '.xls' then Roo::Excel.new(file.path, nil, :ignore)
    when '.xlsx' then Roo::Excelx.new(file.path, nil, :ignore)
    else raise "Wrong file!"
    end
  end
end
