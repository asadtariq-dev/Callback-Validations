# frozen-string-literal: true

# User Model
class User < ApplicationRecord
  validates :username, :email, presence: true

  before_validation :ensure_username_has_value

  after_validation :normalize_username_and_email

  private

  # if username is not given it will get one from the email
  def ensure_username_has_value
    puts 'before validation'
    self.username = email.split('@')[0] if username.nil? && !email.blank?
    puts "#{username}\n#{email}"
  end

  def normalize_username_and_email
    puts 'after validation'
    self.username = username.downcase.titleize
    self.email = email.downcase
    puts "#{username}\n#{email}"
  end
end
