class CreateBlueprint < Blueprinter::Base
  identifier :id

  view :base do
    fields :name, :discription, :price, :from_date, :to_date
  end

  view :extend do
    include_view :base
    fields :create_at, :updated_at, :user_id, :organization, :category_id
  end
end
