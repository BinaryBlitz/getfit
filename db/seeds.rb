# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

specialization = Specialization.create!(name: 'Specialization')
program_type = ProgramType.create!(name: 'Program type')
image = File.open(Rails.root.join('public', 'blank.jpg'))
base64_image = 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='

trainer = Trainer.create!(
  email: 'foo@bar.com',
  password: 'qwerty123',
  first_name: 'Foo', last_name: 'Bar', phone_number: '+79991112233',
  description: 'Description', place_of_work: 'Place of work',
  specialization: specialization, category: 'trainer', experience: 1,
  avatar: image, banner: image
)

VerificationToken.create!(phone_number: '+79991112233', verified: true)

user = User.create!(
  first_name: 'Foo', last_name: 'Bar', phone_number: '+79991112233',
  description: 'Description',
  avatar: base64_image, banner: base64_image,
  height: 180, weight: 80,
  birthdate: 20.years.ago, gender: 'male'
)
user.update!(api_token: 'foobar')

trainer.followings.create!(user: user)
trainer.ratings.create!(user: user, content: 'Rating', value: 1)

program = Program.create!(
  name: 'Program', preview: 'Preview', description: 'Description',
  banner: image, price: 100,
  trainer: trainer, program_type: program_type,
  approved: true
)

program.purchases.create!(user: user)
program.ratings.create!(user: user, content: 'Rating', value: 1)

workout = program.workouts.create!(name: 'Workout', tips: 'Tips', duration: 1)

subscription = trainer.subscriptions.create!(user: user, expires_on: 1.year.from_now)
subscription.messages.create!(
  [
    { content: 'Trainer', category: 'trainer' },
    { content: 'User', category: 'user' }
  ]
)

post = Post.create!(content: 'Content', image: image, trainer: trainer)
comment = post.comments.create!(content: 'Content', author: user)

exercise_type = ExerciseType.create!(
  name: 'Exercise type',
  description: 'Description',
  trainer: trainer
)

workout.exercises.create!(
  [
    { exercise_type: exercise_type, sets: 1, reps: 1 },
    { exercise_type: exercise_type, weight: 1, distance: 1 }
  ]
)

workout.workout_sessions.create!(user: user, scheduled_for: 1.month.from_now)

admin = Admin.create!(email: 'foo@bar.com', password: 'qwerty123')

Specialization.create!(
  [
    { name: 'Единоборства' },
    { name: 'Кроссфит' },
    { name: 'Бодибилдинг' },
    { name: 'Фитнесс' },
    { name: 'Растяжка' },
    { name: 'Йога' },
    { name: 'Футбол' },
    { name: 'Баскетбол' },
    { name: 'Хоккей' },
    { name: 'Танцы' },
    { name: 'Аэробика' },
    { name: 'Акробатика' },
    { name: 'Тяжелая атлетика' },
    { name: 'Легкая атлетика' },
    { name: 'Сноуборд' },
    { name: 'Лыжи' }
  ]
)

Notification.create!(content: 'Notification')
