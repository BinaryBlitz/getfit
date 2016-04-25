# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

specialization = Specialization.create!(name: 'Specialization')
program_type = ProgramType.create!(name: 'Program type')
image = File.open('public/blank.jpg')

trainer = Trainer.create!(
  email: 'baz@qux.com',
  password: 'bazqux',
  first_name: 'Baz', last_name: 'Qux', phone_number: '+79991112233',
  description: 'Description', place_of_work: 'Place of work',
  specialization: specialization, category: 'trainer', experience: 1,
  avatar: image, banner: image
)

VerificationToken.create!(phone_number: '+79998887766', verified: true)

user = User.create!(
  first_name: 'Foo', last_name: 'Bar', phone_number: '+79998887766',
  description: 'Description',
  avatar: image, banner: image,
  height: 180, weight: 80,
  birthdate: 20.years.ago, gender: 'male'
)
user.update!(api_token: 'foobar')

post = Post.create!(content: 'Content', image: image, trainer: trainer)

program = Program.create!(
  name: 'Program', preview: 'Preview', description: 'Description',
  banner: image, duration: 100, price: 100,
  trainer: trainer, program_type: program_type
)

admin = Admin.create!(email: 'foo@bar.com', password: 'qwerty123')

# Push notifications

# app = Rpush::Apns::App.new
# app.name = 'ios_app'
# app.certificate = File.read(Rails.root.join('conifg', 'pushcert.pem')
# app.environment = 'sandbox'
# app.connections = 1
# app.save!
#
# app = Rpush::Gcm::App.new
# app.name = 'android_app'
# app.auth_key = ''
# app.connections = 1
# app.save!
