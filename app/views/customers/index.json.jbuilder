json.array! @customers do |customer|
  json.extract! customer, :id, :name, :gender, :id_no, :birthday, :email, :phone, :address, :fund_account
  json.category do
    if !(category = customer.category)
      json.null!
    else
      json.id category.id
      json.name category.name || "NULL"
      json.desc category.desc || "NULL"
    end
  end
end
