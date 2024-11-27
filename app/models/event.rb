class Event < ApplicationRecord
  validates :name, :price, :category, :organization, presence: true
end
