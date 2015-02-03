json.array!(@products) do |product|
  json.extract! product, :id, :name, :price, :startDate, :endDate, :itinerary, :nights, :productType
  json.url product_url(product, format: :json)
end
