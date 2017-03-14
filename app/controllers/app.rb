class App < Sinatra::Base
  set :views, Proc.new { File.join(root, '../views')}

  get '/' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/:id' do
    @song = Song.find(params[:id])
    erb :'songs/show'
  end

  get '/songs/:id/edit' do
    @song = Song.find(params[:id])
    erb :'songs/edit'
  end

  post '/songs/:id/edit' do
    @song = Song.find(params[:id])
    artist = params[:song][:artist]
    genre = params[:song][:genre]
    album = params[:song][:album]
    length = params[:song][:length]

    if artist != nil
      @song.artist = artist
    end

    if genre != nil
      @song.genre = genre
    end

    if album != nil
      @song.album = album
    end

    if length != nil
      @song.length = length
    end

    @song.save!

    redirect "/songs/#{@song.id}"
    
  end
  
end

