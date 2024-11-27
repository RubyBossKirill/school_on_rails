# frozen_string_literal: true

class Categories::FindCategory < ActiveInteraction::Base # rubocop:disable Style/ClassAndModuleChildren
  string :id
  # TODO: настроить эрорсы
  def execute
    Category.find_by(id:)
  end
end
