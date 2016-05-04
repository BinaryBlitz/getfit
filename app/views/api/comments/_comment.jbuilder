json.extract! comment, :id, :content, :author_type, :created_at, :updated_at

json.author do
  case comment.author_type
  when 'User'
    json.partial! 'api/users/user_preview', user: comment.author
  when 'Trainer'
    json.partial! 'api/trainers/trainer_preview', user: comment.author
  end
end
