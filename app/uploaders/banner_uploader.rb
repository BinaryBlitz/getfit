class BannerUploader < ApplicationUploader
  process resize_to_limit: [800, 320]
end
