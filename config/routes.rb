Rails.application.routes.draw do

  root 'static_pages#home'

  get 'about' => 'static_pages#about'

  devise_for :users, :controllers => {registrations: 'registrations'}

  resources :users, only: [:show, :index] do
    resources :works, except: :index
  end

  resources :works, only: :index


end
