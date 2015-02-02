Rails.application.routes.draw do

  root 'static_pages#home'

  get 'about' => 'static_pages#about'
  get 'discover' => 'static_pages#discover'

  get 'works/get_work_data' => 'works#get_work_data'

  devise_for :users, :controllers => {registrations: 'registrations',
  																		:omniauth_callbacks => "users/omniauth_callbacks"}

  get 'tags/:tag', to: 'works#index', as: :tag

  resources :artists, only: [:show, :edit] do
    resources :works, except: :index
  end

  resources :users, only: [:show, :index]
  resources :works, only: :index

  get 'artist_about/:id', to: 'artists#about', as: :artist_about
  get 'add_tile/:id', to: 'works#add_tile', as: :add_tile
  get 'remove_tile/:id', to: 'works#remove_tile', as: :remove_tile

  resources :venues, only: [:show, :index, :edit] do
    resources :events
  end

end
