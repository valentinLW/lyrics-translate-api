Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope '/api' do
    resources :song, only: %i[index show create]
    resources :lyric, only: [:create]
  end
end
