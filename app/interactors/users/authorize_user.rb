# frozen_string_literal: true

class Users::AuthorizeUser < ActiveInteraction::Base # rubocop:disable Style/ClassAndModuleChildren,Style/Documentation
  string :token
  def execute
    return errors.add(:token, 'Invalid token user') unless token.present?

    user = User.find_by(token: token)
    return errors.add(:user, 'Invalid user not found') unless user

    user
  end
end
