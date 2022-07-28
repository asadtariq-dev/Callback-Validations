# frozen-string-literal: true

# User Model
class User < ApplicationRecord
  validates :username, :email, presence: true

  before_validation :ensure_username_has_value

  private

  # if username is not given it will get one from the email
  def ensure_username_has_value
    self.username = email.split('@')[0] if username.nil? && !email.blank?
  end
end
