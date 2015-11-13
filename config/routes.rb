Rails.application.routes.draw do
  resources :projects do
  	resources :keys
  end

  root 'projects#index'
end
