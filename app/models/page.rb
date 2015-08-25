class Page < ActiveRecord::Base
    translates :title, :content # translated fields
    belongs_to :season
end
