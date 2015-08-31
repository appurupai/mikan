json.season do
  json.id @season.id
  json.title @season.title
  @items.each do |item|
    json.item do
      json.item do
        json.title item.title
        json.category item.category
        json.airing do
          json.from item.airing_from
        end
        json.image item.image
        json.description item.description
        json.url do
          json.hummingbird item.hummingbird_url
          json.official item.official_url
        end
        json.created_at item.created_at
      end
    end
  end
end
