# frozen_string_literal: true

class Events::Destroy < ActiveInteraction::Base # rubocop:disable Style/ClassAndModuleChildren
  integer :id
  def execute
    event = Event.find_by(:id)
    event.destroy
  end
end
