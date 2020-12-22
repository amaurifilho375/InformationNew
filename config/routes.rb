Rails.application.routes.draw do
  
  #resources :comments
  resources :tags
  resources :videos
  resources :reports do
    resources :comments
  end

  get 'comments/:id/edit_personification' => 'comments#edit_personification', as: :edit_personification
   
  get 'comments/update_personification'

  root 'home#index'
  get 'home/index'
  get 'home/manipulationusers'
  get 'home/new'
  get 'home/show_create'
  get 'home/show'
  get 'home/edit'

  get 'home/friends'

  get 'home/:id/show_update' => 'home#show_update', as: :show_update


  get 'home/:id/show_destroy' => 'home#show_destroy', as: :show_destroy

  #delete 'home/:id', controller: 'home', action: 'destroy' , as: 'destroy'

  get 'tags/:id/search_tag' => 'tags#search_tag', as: :search_tag



  devise_for :users

end
