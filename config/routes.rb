Rails.application.routes.draw do
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
