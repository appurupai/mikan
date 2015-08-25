class Contact < ActiveRecord::Base

  # Can't be saved if one of the following attributes is empty
  validates :name, presence: true
  validates :mail, presence: true
  validates :message, presence: true
end
