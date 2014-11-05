get '/' do
  # Look in app/views/index.erb
  @all_albums = Album.all.order('id desc').take(20)
  @all_photos = Photo.all.order('id desc').take(30)
  erb :index
end
