json.array! @categories do |cat|
  json.extract! cat, :id, :name, :desc
end
