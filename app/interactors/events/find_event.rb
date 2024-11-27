# frozen_string_literal: true

class Events::FindEvent < ActiveInteraction::Base # rubocop:disable Style/ClassAndModuleChildren
  string :id
  # TODO: настроить эрорсы
  def execute
    Event.find_by(id:)
  end
end
