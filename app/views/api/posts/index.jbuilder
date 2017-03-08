json.array! @posts do |post|
  json.cache! [post, post.trainer, post.program] do
    json.partial! 'api/posts/post', post: post

    json.trainer do
      json.partial! 'api/trainers/trainer_preview', trainer: post.trainer
    end

    if post.program
      json.program do
        json.partial! 'api/programs/program', program: post.program

        json.program_type do
          json.partial! 'api/program_types/program_type', program_type: post.program.program_type
        end
      end
    end
  end
end
