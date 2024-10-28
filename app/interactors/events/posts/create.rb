# frozen_string_literal: true

class Events::Posts::Create < ActiveInteraction::Base # rubocop:disable Style/ClassAndModuleChildren
  string :name, :description, :category, :organization
  float :price

  def execute
    event = Event.new(inputs)
    return errors.merge!(event.errors) unless event.save

    event
  end
end
