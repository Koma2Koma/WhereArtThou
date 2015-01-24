Rails.application.routes.draw do

  get 'events/show'

  get 'venues/index'

  get 'venues/show'

  root 'static_pages#home'

  get 'about' => 'static_pages#about'
  get 'discover' => 'static_pages#discover'

  devise_for :users, :controllers => {registrations: 'registrations',
  																		:omniauth_callbacks => "users/omniauth_callbacks"}

  get 'tags/:tag', to: 'works#index', as: :tag

  resources :artists, only: [:show, :edit] do
    resources :works, except: :index
  end

  resources :users, only: [:show, :index]
  resources :works, only: :index

  get 'artist_about/:id', to: 'artists#about', as: :artist_about

end
