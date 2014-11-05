post '/album/new' do
	if !login?
    redirect '/signup_and_login'
  else
		@user = User.find_by( username: session[:username] )
		@album= Album.create( title: params[:title], user_id: @user.id, description: params[:description] )
		erb :"photo/new"
	end
end

get '/album' do
	erb :"album/new"
end

get '/users/:user_id/albums' do
	@albums = Album.where(user_id: params[:user_id]).order("created_at DESC")
	erb :"album/show"
end

get '/album/:id' do
	@album = Album.find(params[:id])
	@all_photos = Photo.where( album_id: @album.id ).order("created_at DESC")
	erb :"photo/show"
end

get '/albums/:album_id/:photo_id' do
  	@album = Album.find( params[:album_id] )
		@photo = Photo.find_by( id: params[:photo_id] )
		erb :"photo/show"
end

delete '/album/:id' do
	user = User.find_by( username: session[:username] )
  Album.find(params[:id]).destroy
  redirect "/users/#{user.id}/albums"
end