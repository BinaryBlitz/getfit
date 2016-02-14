class AvatarUploader < ApplicationUploader
  process resize_to_limit: [100, 100]
end
