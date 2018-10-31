# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Book.destroy_all
Post.destroy_all

Book.create([{ title: 'The Hobbit', author: 'JRR Tolkien', page_length: 310 },
	{ title: 'Slaughterhouse-Five', author: 'Kurt Vonnegut', page_length: 275 },
	{ title: 'The Silmarillion', author: 'JRR Tolkien', page_length: 365 }
])
100.times do
	Book.create(
		title: Faker::Book.unique.title,
		author: Faker::Book.author,
		page_length: rand(1000)
		)
end

10.times do
	Post.create(
		message: Faker::Lorem.paragraph(rand(30)),
		user_id: 2
		)
end

10.times do
	Post.create(
		message: Faker::Lorem.paragraph(rand(30)),
		user_id: 1
		)
end
