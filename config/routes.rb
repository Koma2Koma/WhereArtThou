Rails.application.routes.draw do

  get 'static_pages/home'

  get 'static_pages/about'

  get 'home/about'

  root 'static_pages#home'

  get 'about' => 'static_pages#about'

  devise_for :users, :controllers => {registrations: 'registrations'}

  resources :users, only: [:show, :index] do
    resources :works
  end


end
