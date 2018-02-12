Rails.application.routes.draw do
  resources :categories, except:[:new]

  resources :images, except:[:new, :show]

  resources :users, only:[:show] do
    resources :ideas
  end
end
