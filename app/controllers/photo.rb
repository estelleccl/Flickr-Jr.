# Handle GET-request (Show the upload form)
get "/upload" do
	if !login?
    redirect '/signup_and_login'
  else
		@user = User.find_by( username: session[:username] )
	  erb :upload
	end
end      
    
# Handle POST-request (Receive and save the uploaded file)
post "/photo" do 
	if !login?
    redirect '/signup_and_login'
	else
		@user = User.find_by( username: session[:username] )
		@album = Album.find_by( id: params[:album_id] )
		# filename = "#{params[:filename]} + #{params[:album_id]}"
		@photo = Photo.create( album_id: @album.id, filename: params[:filename], caption: params[:caption])
		@all_photos = Photo.where( album_id: @album.id )
	  erb :"album/upload"
	end
end

get '/photos/new' do
	if !login?
    redirect '/signup_and_login'
  else
		@album = Album.find(params[:id])
		@all_photos = Photo.where( album_id: @album.id ).order("created_at DESC")
		erb :"photo/new"
	end
end

delete '/photo/:id' do
	photo = Photo.find( params[:id] )
  Photo.find(params[:id]).destroy
  redirect "/album/#{photo.album_id}"
end
