class AvatarUploader < ApplicationUploader
  process resize_to_limit: [160, 160]
end
