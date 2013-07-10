json.extract! @customer, :id, :name, :gender, :id_no, :birthday, :email, :phone, :address, :fund_account

json.category do
  if !(category = @customer.category)
    json.null!
  else
    json.extract! category, :id, :name, :desc
  end
end
