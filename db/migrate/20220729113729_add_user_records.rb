# frozen_string_literal: true

# Migration for creating dummy users
class AddUserRecords < ActiveRecord::Migration[7.0]
  def change
    reversible do |dir|
      dir.up do
        10.times do |i|
          puts "Creating User #{i + 1}"
          User.create(email: "user_#{i + 1}#{i + 1}@gmail.com")
        end
      end
      dir.down do
        10.times do |i|
          puts "Deleting User #{i + 1}"
          User.find_by(email: "user_#{i + 1}#{i + 1}@gmail.com").destroy
        end
      end
    end
  end
end
