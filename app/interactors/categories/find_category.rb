# frozen_string_literal: true

class Categories::FindCategory < ActiveInteraction::Base # rubocop:disable Style/ClassAndModuleChildren
  string :id
  # TODO: настроить эрорсы
  def execute
    category = Category.find_by(id:)
    return errors.add(:id, 'id not found') unless category

    category
  end
end
