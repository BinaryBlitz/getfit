# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

specialization = Specialization.create!(name: 'Specialization')
image = File.open('public/blank.jpg')

trainer = Trainer.create!(
  email: 'baz@qux.com',
  password: 'bazqux',
  first_name: 'Baz', last_name: 'Qux', phone_number: '+79991112233',
  description: 'Description', place_of_work: 'Place of work',
  specialization: specialization, category: 'trainer', experience: 1,
  avatar: image, banner: image
)

user = User.create!(
  name: 'Foo', phone_number: '+79998887766',
  description: 'Description',
  avatar: image, banner: image,
  height: 180, weight: 80,
  birthdate: 20.years.ago, gender: 'male'
)
