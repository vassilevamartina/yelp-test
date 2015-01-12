 class User < ActiveRecord::Base

	has_many :photos

  has_many :places, through: :user_places

	has_secure_password

	validates_uniqueness_of :email

  has_attached_file :image,
                :styles => { :square => ['480x480#', :jpg] },
                :storage => :s3,
                # :bucket => 'chomp-app',
                :bucket => ENV['S3_BUCKET'],
                :url => ':s3_domain_url',
                :path => ':class/:attachment/:id/:style/:filename',
                 :s3_credentials => {
                   :bucket => ENV['S3_BUCKET'],
                   :access_key_id => ENV['S3_ACCESS_KEY_ID'],
                   :secret_access_key => ENV['S3_SECRET_ACCESS_KEY']
                 }
                # :s3_credentials => '#{Rails.root}/config/app_environment_variables.rb',
                
  
               
end
