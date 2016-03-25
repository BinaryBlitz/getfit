json.partial! 'program', program: @program

json.workouts @program.workouts, partial: 'api/workouts/workout', as: :workout
