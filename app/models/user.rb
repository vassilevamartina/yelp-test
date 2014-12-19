 class User < ActiveRecord::Base

	has_many :photos

  has_many :places, through: :user_places

	has_secure_password

	validates_uniqueness_of :email

  has_attached_file :image,
                :styles => { :square => ['480x480#', :jpg] },
                :storage => :s3,
                :bucket => 'chomp-app',
                :url => ':s3_domain_url',
                :path => ':class/:attachment/:id/:style/:filename',
                :s3_credentials => {
                  :bucket => ENV['s3_bucket'],
                  :access_key_id => ENV['s3_access_key_id'],
                  :secret_access_key => ENV['s3_secret_access_key']
                }
  
               
end
