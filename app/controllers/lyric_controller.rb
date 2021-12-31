class LyricController < ApplicationController
  def create
    @from_language = Language.find_by(name: params[:from_language])
    @to_language = Language.find_by(name: params[:to_language])
    @song = Song.find_by(slug: params[:song_slug])

    @original = Translation.create(language: @from_language, song: @song)
    @translation = Translation.create(language: @to_language, song: @song)

    params[:from].count.times do |index|
      Lyric.create(translation: @original, line: index, content: params[:from][index])
      Lyric.create(translation: @translation, line: index, content: params[:to][index])
    end
    render json: { ok: "ok" }
  end
end
