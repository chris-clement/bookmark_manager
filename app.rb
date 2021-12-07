require_relative('./lib/bookmark.rb')
require 'sinatra'
require 'sinatra/reloader'

class Bookmark_Manager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do 
    redirect '/bookmarks'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.new
    erb :index
  end
  
  run! if app_file == $0
end