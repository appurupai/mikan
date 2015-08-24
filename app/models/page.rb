class Page < ActiveRecord::Base
    translates :title, :content
    belongs_to :season
end
