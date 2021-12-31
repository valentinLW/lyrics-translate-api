class TranslationController < ApplicationController
  def show
    @translation = Translation.find_by(slug: params[:translation_slug])
    @original = Translation.find_by(song: @translation.song, language: @translation.song.language)
    render json: { translation: @translation, from: @original.lyrics, to: @translation.lyrics }
  end

  def index
    @translations = Translation.all

    render json: { translations: @translations }
  end
end
