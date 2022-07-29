# frozen-string-literal: true

# User Model
class User < ApplicationRecord
  # validates :username, :email, presence: true

  before_validation :ensure_username_has_value
  after_validation :normalize_username_and_email

  # before_save :validate_before_save

  # after_save :validate_after_save
  # around_save :validate_around_save

  private

  # if username is not given it will get one from the email
  def ensure_username_has_value
    # puts 'before validation.......'
    self.username = email.split('@')[0] if username.nil? && !email.blank?
    # puts "#{username}\n#{email}"
  end

  def normalize_username_and_email
    # puts 'after validation.......'
    self.username = username.upcase
    self.email = email.downcase
    # puts "#{username}\n#{email}"
  end

  def validate_before_save
    puts '===================before saving.....'
  end

  def validate_around_save
    puts '==================around saving.....'
  end

  def validate_after_save
    puts '==================after saving.....'
  end
end
