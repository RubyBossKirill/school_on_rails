# frozen_string_literal: true

class Events::Index < ActiveInteraction::Base # rubocop:disable Style/ClassAndModuleChildren
  def execute
    Event.all
  end
end
