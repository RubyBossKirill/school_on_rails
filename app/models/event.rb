class Event < ApplicationRecord
  validates :name, :price, :organization, presence: true
  belongs_to :category
  belongs_to :user
end
