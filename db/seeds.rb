# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'securerandom'

def seed_admins
  admins = [
    'hecbeita1988@gmail.com',
    'admin@acmv.com'
  ]

  admins.each do |email|
    User.find_or_initialize_by(email: email) do |user|
      user.email    = email
      user.password = SecureRandom.hex(8)
      user.save
    end
  end
end

seed_admins
