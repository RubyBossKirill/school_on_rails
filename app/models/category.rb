class Category < ApplicationRecord
  validates :name, presence: true
  has_many :events
  belongs_to :user
end
