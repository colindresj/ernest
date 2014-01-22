Dropbox::API::Config.app_key = ENV['DROPBOX_APPKEY']
Dropbox::API::Config.app_secret = ENV['DROPBOX_SECRETKEY']
Dropbox::API::Config.mode = 'sandbox' # single-directory is "sandbox" - full access is "dropbox"

