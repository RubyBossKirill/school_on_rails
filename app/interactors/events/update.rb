class Events::Update < ActiveInteraction::Base
  object :event, class: Event
  integer :price, default: nil
  string :name, :organization, default: nil
  string :description, default: nil

  def execute
    errors.merge!(event.errors) unless event.update(inputs.except(:event).compact)

    event
  end
end
