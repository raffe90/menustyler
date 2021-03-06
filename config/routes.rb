Rails.application.routes.draw do
  devise_for :users

  constraints(Subdomain) do
    get '/' => 'groups#show'
  end

  root :to => "pages#index"

  resources :menus do 
    resources :templates
  end
end
