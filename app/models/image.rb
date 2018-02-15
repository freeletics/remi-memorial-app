class Image < ApplicationRecord
  belongs_to :message

  after_destroy_commit :purge_file

  def public_id
    external_id.split("/").second.split(".").first
  end

  private

  def purge_file
    PurgeFileJob.perform_later(public_id)
  end
end
