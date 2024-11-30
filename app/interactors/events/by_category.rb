# frozen_string_literal: true

class Events::ByCategory < ActiveInteraction::Base # rubocop:disable Style/ClassAndModuleChildren,Style/Documentation
  string :category_id
  def execute
    Event.where(category: category_id)
  end
end
