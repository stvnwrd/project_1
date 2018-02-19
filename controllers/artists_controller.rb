require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/artist.rb')
require_relative('../models/album.rb')

#index

get '/artists' do
  @artists = Artist.find_all()
  erb (:"artists/index")
end

# new

get "/artists/new" do
  @artists = Artist.find_all()
  @albums = Album.find_all()
  erb( :"/artists/new")
end


#show

get '/artists/:id' do
  @artist = Artist.find(params['id'].to_i)
  erb( :"/artists/show")
end



#create

post "/artists" do
  @artist = Artist.new(params)
  @artist.save()
  erb(:"/artists/create")
end


# destroy

post "/artists/:id/delete" do
  Artist.delete(params[:id])
  redirect to ("/artists")
end
