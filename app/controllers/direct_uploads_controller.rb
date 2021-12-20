class DirectUploadsController < ActiveStorage::DirectUploadsController
  skip_before_action :verify_authenticity_token

  def create
    byebug
  end


  private

  def direct_upload_json(blob)
    blob.as_json(root: false, methods: :signed_id).merge(direct_upload: {
      url: blob.service_url_for_direct_upload,
      headers: blob.service_headers_for_direct_upload
    })
  end
end
