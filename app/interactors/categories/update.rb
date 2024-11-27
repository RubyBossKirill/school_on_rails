class Events::Update < ActiveInteraction::Base
  object :category, class: Category
  string :name

  def execute
    errors.merge!(category.errors) unless category.update(inputs.except(:category).compact)

    category
  end
end
