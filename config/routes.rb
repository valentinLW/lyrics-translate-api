Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope '/api' do
    resources :song, only: %i[index show create], param: :song_slug
    resources :lyric, only: [:create]
    resources :translation, only: %i[index show], param: :translation_slug
  end
end
