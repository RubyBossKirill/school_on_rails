# frozen_string_literal: true

class Events::Show < ActiveInteraction::Base # rubocop:disable Style/ClassAndModuleChildren
  string :id
  def execute
    Event.find_by(id:)
  end
end
