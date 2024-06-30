# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

(0..20).each do |p|
  p = Product.new
  p.name = Faker::Food.dish
  p.description = Faker::Food.description
  p.mrp = Faker::Commerce.price
  p.nrp = Faker::Commerce.price
  p.quantity = Faker::Number.between(from: 1, to: 10)
  p.status = [1,2].sample
  p.slug = p.name.downcase.gsub(' ', '-')
  p.save
end
