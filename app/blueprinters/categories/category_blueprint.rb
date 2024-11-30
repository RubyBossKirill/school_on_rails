class CategoryBlueprint < Blueprinter::Base
  identifier :id

  view :base do
    fields :name
  end

  view :extend do
    include_view :base
    fields :create_at, :updated_at, :user_id
  end
end
