Rails.application.routes.draw do
  root 'alerts#index'
  get 'alerts/index'

  get 'alerts/create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
