json.array!(@orbs) do |orb|
  json.extract! orb, :id, :category, :name, :description, :image
  json.url orb_url(orb, format: :json)
end
