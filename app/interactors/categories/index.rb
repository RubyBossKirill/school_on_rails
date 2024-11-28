# frozen_string_literal: true

class Categories::Index < ActiveInteraction::Base # rubocop:disable Style/ClassAndModuleChildren
  def execute
    Category.all
  end
end
