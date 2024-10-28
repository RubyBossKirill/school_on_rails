class Event < ApplicationRecord
  validates :name, :description, :price, :category, :organization, presence: true
end
