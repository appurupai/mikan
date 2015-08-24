class Season < ActiveRecord::Base
  translates :title, :notice
  has_one :page
  has_many :items
  accepts_nested_attributes_for :items, allow_destroy: true
end
