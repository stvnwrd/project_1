require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/artist.rb')
require_relative('../models/album.rb')

#index

get '/albums' do
  @albums = Album.find_all()
  erb (:"albums/index")
end

#new

get "/albums/new" do
  @artists = Artist.find_all()
  @albums = Album.find_all()
  erb ( :"/albums/new")
end


# show

get '/albums/:id' do
  @album = Album.find(params['id'].to_i)
  erb (:"albums/show")
end

# create

post "/albums" do
  @album = Album.new(params)
  @album.save()
  erb(:"/albums/create")
end
