Rails.application.routes.draw do
  # get ':controller(/:action(/:id))'
  root to: "items#index"
  resources :items

end
