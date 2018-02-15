class PurgeFileJob < ApplicationJob
  def perform(public_image_id)
    Cloudinary::Uploader.destroy(public_image_id)
  end
end
