Rails.application.routes.draw do
  root 'home#index'
  resources :frogs do
    resources :tadpoles
    # /frogs/:frog_id/tadpoles => GET POST
    # /frogs/:frog_id/tadpoles/:id => GET, PUT OR PATCH, DELETE
    # /frogs/:frog_id/tadpoles/new GET
    # /frogs/:frog_id/tadpoles/edit GET
  end
  
  resources :tadpoles
  # /tadpoles => GET POST
  # /tadpoles/:id => GET, PUT OR PATCH, DELETE
  # /tadpoles/new GET
  # /tadpoles/edit GET
  post "tadpoles/:id" => "tadpoles#evolve"
  resources :ponds
  
end
