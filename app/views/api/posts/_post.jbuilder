json.extract! post,
              :id, :content, :image_url, :created_at, :updated_at,
              :likes_count, :comments_count

json.like_id current_user.likes.find_by(post: post).try(:id) if current_user
