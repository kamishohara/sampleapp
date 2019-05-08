Rails.application.routes.draw do
  devise_for :users
  get 'items/search'
  get 'items/kawase' => 'items#kawase'
  post 'items/search' => 'items#index'
  get 'users/index' => 'users/index'
  get 'items/items_index' => 'items/index'
  get 'items/toppage' => 'items#search'
  post 'save' => 'items#save'

  # get 'new/user/registration' => ' users/registrations#new'
  root 'items#search'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
