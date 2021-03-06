 # if Rails.env.production?
CarrierWave.configure do |config|

  # Use local storage if in development or test
  if Rails.env.development? || Rails.env.test? #borrar
    CarrierWave.configure do |config|
      config.storage = :file
    end
  end

  # Use AWS storage if in production
  if Rails.env.production? #borrar
    CarrierWave.configure do |config|
      config.storage = :fog
    end
  end

if Rails.env.production? #borrar
  config.fog_credentials = {
    # Configuration for Amazon S3 should be made available through an Environment variable.
    # For local installations, export the env variable through the shell OR
    # if using Passenger, set an Apache environment variable.
    #
    # In Heroku, follow http://devcenter.heroku.com/articles/config-vars
    #
    # $ heroku config:add S3_KEY=your_s3_access_key S3_SECRET=your_s3_secret S3_REGION=eu-west-1 S3_ASSET_URL=http://assets.example.com/ S3_BUCKET_NAME=s3_bucket/folder

    # Configuration for Amazon S3
    :provider              => 'AWS',
    :aws_access_key_id     => ENV['S3_KEY'],
    :aws_secret_access_key => ENV['S3_SECRET'],
    :region                => 'us-east-2'
    # host:                  's3.example.com',             # optional, defaults to nil
    # endpoint:              'https://s3.example.com:8080' # optional, defaults to nil
  }
  #config.fog_directory = ENV['S3_BUCKET']
  # For testing, upload files to local `tmp` folder.
# elsif Rails.env.test? || Rails.env.cucumber?
#    config.storage = :file
#      config.enable_processing = false
#      config.root = "#{Rails.root}/tmp"
  # else
    # config.storage = :fog

  #
   config.cache_dir = "#{Rails.root}/tmp/uploads"                  # To let CarrierWave work on heroku
  #
   config.fog_directory    = 'medilinxmx'
   config.fog_public     = false                             # Generate http:// urls. Defaults to :authenticated_read (https://)
   config.fog_attributes = {'Cache-Control'=>'max-age=315576000'} # optional, defaults to {}
end
end #borrar
