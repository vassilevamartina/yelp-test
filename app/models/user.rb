 class User < ActiveRecord::Base

	has_many :photos

  has_many :places, through: :user_places

	has_secure_password

	validates_uniqueness_of :email

  has_attached_file :image,
                :styles => { :square => ['480x480#', :jpg] },
                :default_url => 'https://chomp-app.herokuapp.com/',
                :storage => :s3,
                :bucket => 'chomp-app',
                :s3_credentials => "#{Rails.root}/config/s3.yml"
end
