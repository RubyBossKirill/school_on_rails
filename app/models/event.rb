class Event < ApplicationRecord
  validates :name, :price, :organization, presence: true
  validates_datetime :from_date, :to_date, presence: true
  belongs_to :category
  belongs_to :user
end
