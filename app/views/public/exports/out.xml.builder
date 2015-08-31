xml.instruct!
xml.season do
  xml.id @season.id
  xml.title @season.title
  xml.items do
    @items.each do |item|
      xml.item do
        xml.title item.title
        xml.category item.category
        xml.airing do
          xml.from item.airing_from
        end
        xml.image item.image
        xml.description item.description
        xml.url do
          xml.hummingbird item.hummingbird_url
          xml.official item.official_url
        end
        xml.created_at item.created_at
      end
    end
  end
end
