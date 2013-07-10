class Customer < ActiveRecord::Base
  belongs_to :customer_category
  VALID_HEADER = %w{name fund_account gender id_no address phone birthday email}

  def category
    customer_category
  end

  def self.import(file)
    excel = open_excel(file)
    header = excel.row(1)
    (2..excel.last_row).each do |i|
      row = Hash[[header, excel.row(i)].transpose]
      row.delete_if { |k, v| !VALID_HEADER.include?(k) }
      row["phone"] = row["phone"].floor.to_s if row['phone'] and row['phone'].is_a?(Float)
      row["email"] = "#{row["id_no"]}@example.com" unless header.include?("email")
      Customer.create!(row)
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
