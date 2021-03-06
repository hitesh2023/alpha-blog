# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


100.times do |x|
	Article.create!(
		title: Faker::Name.name,
		description: Faker::Lorem.paragraph_by_chars(number: 500, supplemental: false),
		user_id: 14
	)
end
