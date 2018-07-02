json.array!(@orders) do |order|
  json.extract! order, :id, :person_id, :description, :unity_price, :quantity, :supplier_id
  json.url order_url(order, format: :json)
end
