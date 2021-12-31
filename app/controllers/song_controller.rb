class SongController < ApplicationController
  def create
    @language = Language.find_by(name: params[:language])
    @artist = Artist.find_by(name: params[:artist])
    @artist = Artist.create(name: params[:artist]) unless @artist

    @song = Song.create(title: params[:title], artist: @artist, language: @language)
    render json: { song: @song }, status: 200
  end

  def show
    @song = Song.find_by(slug: params[:song_slug])
    @from = Lyric.where(song: @song, language: @from_language)
    render json: { song: @song }
  end
end
