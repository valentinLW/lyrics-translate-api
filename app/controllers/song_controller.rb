class SongController < ApplicationController
  def create
    @language = Language.find_by(name: params[:language])
    @artist = Artist.find_by(name: params[:artist])
    @artist = Artist.create(name: params[:artist]) unless @artist

    @song = Song.create(title: params[:title], artist: @artist, language: @language)
    render json: { song: @song }, status: 200
  end
end
