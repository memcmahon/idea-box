Rails.application.routes.draw do
  get '/', to: 'welcome#index', as: 'root'

  resources :categories, except:[:new]

  resources :images, except:[:new, :show]

  resources :idea_images, only:[:create, :destroy]

  resources :users, only:[:new, :create]

  resources :users, only:[:show] do
    resources :ideas
  end
end
