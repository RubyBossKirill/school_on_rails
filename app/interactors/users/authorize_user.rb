# frozen_string_literal: true

class Users::AuthorizeUser < ActiveInteraction::Base # rubocop:disable Style/ClassAndModuleChildren,Style/Documentation
  hash :headers
  def execute
    puts headers
    return errors.add(:headers, 'Authorization header is missing') unless headers['Authorization'].present?

    token = headers['Authorization']
    return errors.add(:token, 'Invalid token') unless token.present?

    user = User.find_by(token: token)
    return errors.add(:user, 'User not found') unless user

    user
  end
end
