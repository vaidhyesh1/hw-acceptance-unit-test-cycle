Rottenpotatoes::Application.routes.draw do
  resources :directors
  
  resources :movies
  # map '/' to be a redirect to '/movies'
  root :to => redirect('/movies')
end
