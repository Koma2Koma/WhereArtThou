Rails.application.routes.draw do

  root 'static_pages#home'

  get 'about' => 'static_pages#about'

  devise_for :users, :controllers => {registrations: 'registrations'}

  resources :users, only: [:show, :index] do
  	resources :artists, only: [:show, :edit] do
    	resources :works, except: :index
  	end
  end

  resources :works, only: :index
end
