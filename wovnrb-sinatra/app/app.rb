
require 'sinatra'
require 'sinatra/reloader'

require 'wovnrb'

use Wovnrb::Interceptor, {
      :project_token => 'TOKEN',
      :default_lang => 'en',
      :supported_langs => ['en', 'ja'],
      :url_pattern => 'query'
}

get '/' do
  erb :index
end
