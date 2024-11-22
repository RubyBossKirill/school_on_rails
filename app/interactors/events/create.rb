# frozen_string_literal: true

class Events::Create < ActiveInteraction::Base # rubocop:disable Style/ClassAndModuleChildren,Style/Documentation
  string :name, :category, :organization
  string :description, default: ''
  float :price
  def execute
    event = Event.new(inputs.to_h.compact)
    return errors.merge!(event.errors) unless event.save

    event
  end
end
