Rails.application.routes.draw do


  get 'carros/show'

  devise_for :admins, :skip => [:registrations], path: 'admins', controllers: { sessions: "admins/sessions"}
  devise_for :users, path: 'users', controllers: { sessions: "users/sessions"}
  resources :comentarios

  root 'welcome#index'
  get 'welcome/vista'
  get 'welcome/aceptar_rechazar'

  resources :pedidos
  get 'carros/:id' => "carros#show", as: "carro"
  delete 'carros/:id' => "carros#destroy"

  post 'placements' => "placements#create", as: "placements"
  post 'placements/:id/disminuir' => "placements#disminuir", as: "placement_disminuir"
  post 'placements/:id/aumentar' => "placements#aumentar", as: "placement_aumentar"
  get 'placements/:id' => "placements#show", as: "placement"
  delete 'placements/:id' => "placements#destroy"

  get 'placements' => 'placements#index', as: "restaurant_placements_list"
  post 'placements/:id/confirm' => 'placements#confirm', as: "placement_confirm"
  post 'placements/:id/reject' => 'placements#reject', as: "placement_reject"

  resources :restaurants do
    get :aceptar
    get :favorito
    resources :platos do
      get :favorito
      resources :coments
    end
    resources :comentarios
  end
end
