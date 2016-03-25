json.partial! 'program', program: @program

json.stages @program.stages, partial: 'api/stages/stage', as: :stage
