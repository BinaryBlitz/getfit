json.extract! post, :id, :content, :image_url, :created_at, :updated_at

json.likes_count post.likes.count
json.like_id current_user.likes.find_by(post: post).try(:id) if current_user
