# frozen_string_literal: true

class Users::AuthorizeUser < ActiveInteraction::Base # rubocop:disable Style/ClassAndModuleChildren,Style/Documentation
  string :token
  def execute
    puts token
    user = User.find_by(token: token)
    return errors.add(:user, 'User not found') unless user

    user
  end
end
