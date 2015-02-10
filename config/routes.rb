Nenep::Application.routes.draw do
  resources :products
  resources :articles

  devise_for :users, :path => '', :path_names => {:sign_in => 'admin'}
  get "welcome/index"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  ### ARTICLES ROUTES 
  get 'article/:id/visible' => 'articles#updateVisibility'
  get 'welcome/articles/:id' => 'welcome#showReading'
  get 'welcome/articles/' => 'welcome#showReadingList'

  ### PRODUCTS ROUTES
  get 'product/:id/visible' => 'products#updateVisibility'
  get 'product/new/:productType' => 'products#new'
  get 'products/list/:productType' => 'products#index'
  
  get '/welcome/products/:type' => 'welcome#showPackages'
end
