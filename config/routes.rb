Rails.application.routes.draw do
  resources :categories, except:[:new]

  resources :users, only:[:show] do
    resources :ideas
  end
end
