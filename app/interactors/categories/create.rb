# frozen_string_literal: true

class Categories::Create < ActiveInteraction::Base # rubocop:disable Style/ClassAndModuleChildren
  string :name, :user_id
  def execute
    category = Category.new(inputs.to_h.compact)
    return errors.merge!(category.errors) unless category.save

    category
  end
end
