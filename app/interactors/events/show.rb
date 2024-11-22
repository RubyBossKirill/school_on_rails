# frozen_string_literal: true

class Events::Show < ActiveInteraction::Base # rubocop:disable Style/ClassAndModuleChildren
  integer :id
  def execute
    Event.find_by(:id)
  end
end
