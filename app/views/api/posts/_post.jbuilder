json.extract! post,
              :id, :content, :image_url, :created_at, :updated_at,
              :likes_count, :comments_count

if post.program
  json.program do
    json.partial! 'api/programs/program', program: post.program

    json.program_type do
      json.partial! 'api/program_types/program_type', program_type: post.program.program_type
    end
  end
end

json.like_id current_user.likes.find_by(post: post).try(:id) if current_user
