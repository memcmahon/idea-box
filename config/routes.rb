Rails.application.routes.draw do
  resources :categories, except:[:new]
end
