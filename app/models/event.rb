class Event < ApplicationRecord
  validates :name, :price, :organization, presence: true
  validates :from_date, :to_date, presence: true
  validate :to_date_after_from_date, :validate_date_format
  belongs_to :category
  belongs_to :user

  before_validation :parse_dates

  private

  def parse_dates
    self.from_date = Date.parse(from_date) if from_date.is_a?(String) && from_date.present?
    self.to_date = Date.parse(to_date) if to_date.is_a?(String) && to_date.present?
  rescue ArgumentError
    errors.add(:from_date, "Неверный формат даты и времени. Используйте YYYY-MM-DD") if from_date.present?
    errors.add(:to_date, "Неверный формат даты и времени. Используйте YYYY-MM-DD") if to_date.present?
  end

  # Валидация на корректность формата Date
  def validate_date_format
    unless from_date.is_a?(Date)
      errors.add(:from_date, "Неверный формат даты и времени. Используйте YYYY-MM-DD")
    end
    unless to_date.is_a?(Date)
      errors.add(:to_date, "Неверный формат даты и времени. Используйте YYYY-MM-DD")
    end
  end

  def to_date_after_from_date
    if to_date.present? && from_date.present? && to_date < from_date
      errors.add(:to_date, "должна быть позже даты начала")
    end
  end
end
