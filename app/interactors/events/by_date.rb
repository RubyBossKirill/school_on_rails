# frozen_string_literal: true

class Events::ByDate < ActiveInteraction::Base # rubocop:disable Style/ClassAndModuleChildren,Style/Documentation
  string :from_date, :to_date
  def execute
    Event.where(category: category_id)
  end
end
