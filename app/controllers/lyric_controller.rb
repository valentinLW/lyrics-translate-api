class LyricController < ApplicationController
  def create
    @from_language = Language.find_by(name: params[:from_language])
    @to_language = Language.find_by(name: params[:to_language])
    @song = Song.find_by(slug: params[:song_slug])

    params[:from].count.times do |index|
      Lyric.create(song: @song, language: @from_language, line: index, content: params[:from][index])
      Lyric.create(song: @song, language: @to_language, line: index, content: params[:to][index])
    end
    render json: { ok: "ok" }
  end
end
