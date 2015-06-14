S3DirectUpload.config do |c|
  c.access_key_id = ENV['AWS_ACCESS_KEY_ID']       		# your access key id
  c.secret_access_key = ENV['AWS_SECRET_ACCESS_KEY']    # your secret access key
  c.bucket = "ENV['S3_BUCKET']"              # your bucket name
  c.url = "https://#{c.bucket}.s3.amazonaws.com/"
end

module S3DirectUpload
  module UploadHelper
    class S3Uploader
      def url
        "http#{@options[:ssl] ? 's' : ''}://#{@options[:bucket]}.#{@options[:region]}.amazonaws.com/"
      end
    end
  end
end