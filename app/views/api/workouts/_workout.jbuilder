json.extract! workout, :id, :position

json.exercises workout.exercises, partial: 'api/exercises/exercise', as: :exercise
