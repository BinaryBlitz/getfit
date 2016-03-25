json.extract! stage, :id, :position

json.exercises stage.exercises, partial: 'api/exercises/exercise', as: :exercise
