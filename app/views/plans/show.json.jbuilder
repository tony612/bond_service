json.extract! @plan, :id, :name, :category, :desc, :content
json.customer_category_ids @plan.customer_categories.map(&:id)
