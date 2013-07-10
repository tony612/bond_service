json.array! @plans do |plan|
  json.extract! plan, :id, :name, :category, :desc, :content, :customer_categories
end
