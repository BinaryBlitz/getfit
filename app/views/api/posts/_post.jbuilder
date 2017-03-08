json.cache! post do
  json.extract! post,
                :id, :content, :image_url, :created_at, :updated_at, :comments_count

  if post.program
    json.program do
      json.partial! 'api/programs/program', program: post.program

      json.program_type do
        json.partial! 'api/program_types/program_type', program_type: post.program.program_type
      end
    end
  end
end
