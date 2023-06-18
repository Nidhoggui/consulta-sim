Rails.application.routes.draw do
  get 'pages/home'

  root 'pages#home'

  resources :consultas

  resources :medicos do
    member do
      get 'consultas', to: 'consultas#index'
    end
  end

  resources :pacientes do
    resources :enderecos
    post 'agendar_consulta', on: :member
  end

end
