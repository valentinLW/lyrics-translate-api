class TranslationController < ApplicationController
  def show
    @translation = Translation.find_by(slug: params[:translation_slug])
    render json: { translation: @translation, lyrics: @translation.lyrics }
  end
end
