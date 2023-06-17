Rails.application.routes.draw do
  resources :consulta

  resources :medicos do
    get 'consultas', on: :member
  end

  resources :pacientes do
    resources :enderecos
    post 'agendar_consulta', on: :member
  end

end
