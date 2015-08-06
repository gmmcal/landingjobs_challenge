Rails.application.routes.draw do
  root to: 'homepage#index'

  get 'companies', to: 'homepage#companies'
  get 'readme', to: 'application#index'
end
