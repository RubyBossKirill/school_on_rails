# frozen_string_literal: true

class Events::ByDate < ActiveInteraction::Base # rubocop:disable Style/ClassAndModuleChildren,Style/Documentation
  date :from_date, :to_date
  def execute
    Event.where('from_date <= ? AND to_date >= ?', to_date, from_date)
  end
end
