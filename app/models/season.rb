class Season < ActiveRecord::Base
  translates :title, :notice # translated fields
  has_one :page
  has_many :items
  # the items are created through the season, that's why we have to allow the "items_attributes" (nested form)
  accepts_nested_attributes_for :items, allow_destroy: true
end
