Rails.application.routes.draw do
  resources :categories, except:[:new]

  resources :images, except:[:new, :show]

  resources :idea_images, only:[:create]

  resources :users, only:[:show] do
    resources :ideas
  end
end
