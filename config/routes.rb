RssRepeater::Application.routes.draw do

  devise_for :users

  root to: "pages#index"

  resources :feeds

end
