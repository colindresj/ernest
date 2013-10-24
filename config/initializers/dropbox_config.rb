Dropbox::API::Config.app_key    = ENV['DROPBOX_APPKEY']
Dropbox::API::Config.app_secret = ENV['DROPBOX_SECRETKEY']
Dropbox::API::Config.mode       = 'sandbox' # if you have a single-directory app or "dropbox" if it has access to the whole dropbox
