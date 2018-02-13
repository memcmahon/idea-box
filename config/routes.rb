Rails.application.routes.draw do
  get '/', to: 'welcome#index', as: 'root'

  namespace :admin do
    resources :categories, except:[:new]
  end

  resources :images, except:[:new, :show]

  resources :idea_images, only:[:create, :destroy]

  resources :users, only:[:new, :create]

  resources :users, only:[:show] do
    resources :ideas
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
