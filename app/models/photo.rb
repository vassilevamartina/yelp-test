class Photo < ActiveRecord::Base
	belongs_to :user
  belongs_to :place
	has_attached_file :image,
                :styles => { 

                    :original => '1920x1680>',
                    :small    => '100x100#',
                    :medium   => '250x250',
                    :large    => '500x500>'
                  },
                :storage => :s3,
                :bucket => 'chomp-app',
                #:url => ':s3_domain_url',
                :path => ':class/:attachment/:id/:style/:filename',
                :s3_credentials => {
                  :bucket => ENV['S3_BUCKET'],
                  :access_key_id => ENV['S3_ACCESS_KEY_ID'],
                  :secret_access_key => ENV['S3_SECRET_ACCESS_KEY']
                },
                :use_timestamp => false

	validates_attachment_content_type :image, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
