# if Rails.env == "production"
     # set credentials from ENV hash
 #S3_CREDENTIALS = { :access_key_id => ENV['s3_access_key_id'], :secret_access_key => ENV['s3_secret_access_key'], :bucket => "chomp-app"}
 #else
     # get credentials from YML file
  #   S3_CREDENTIALS = Rails.root.join("config/s3.yml")
 #end