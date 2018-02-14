Rails.application.routes.draw do
  get '/', to: 'welcome#index', as: 'root'

  namespace :admin do
    resources :categories, except:[:new]
    resources :images, except:[:new, :show]
  end

  resources :users, only:[:new, :create]

  resources :users, only:[:show] do
    resources :ideas
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
