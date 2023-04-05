# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

%w[dev black category_b].each do |category_name|
  category = Category.create(name: category_name)

  10.times { Joke.create(message: Faker::TvShows::TheITCrowd.quote, category_id: category.id) }
end



category = Category.new(name: 'test')

if category.valid?
  category.save
end
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?