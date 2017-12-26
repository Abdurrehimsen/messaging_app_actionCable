Rails.application.routes.draw do
	
  resources :chat_rooms, only: [:new, :create, :show, :index] do
  	resources :messages, only: [:create]
  end

  mount ActionCable.server => '/cable'
  root 'chat_rooms#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
