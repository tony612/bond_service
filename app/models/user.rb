class User < ActiveRecord::Base
  VALID_HEADER = %w{email password password_confirmation name desc number}

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # For the moment when there is no username
  def display_name
    email.gsub(/@.*/, "")
  end

  def self.import(file)
    excel = open_excel(file)
    header = excel.row(1)
    (2..excel.last_row).each do |i|
      row = Hash[[header, excel.row(i)].transpose]
      row['desc'] = row['company'] + row['branch'] + row['position']
      row.delete_if { |k, v| !VALID_HEADER.include?(k) }
      row["number"] = row["number"].floor.to_s if row['number'] and row['number'].is_a?(Float)
      row["email"] = row['name'].underscore.gsub(/\s+/, "_") + "@example.com"
      row['password'] = row['password_confirmation'] = 'password'
      User.create!(row)
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
