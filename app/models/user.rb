class User < ActiveRecord::Base

	has_many :photos

  has_many :places, through: :user_places

	has_secure_password

	validates_uniqueness_of :email

	has_attached_file :download,
                    :storage => :s3,
                    :s3_credentials => Proc.new{|a| a.instance.s3_credentials },
                    :s3_permissions => :private

  def s3_credentials
    {:bucket => ENV['bucket'], :access_key_id => ENV['access_key_id'], :secret_access_key => ENV['secret_access_key']}
  end
end
