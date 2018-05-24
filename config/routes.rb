Rails.application.routes.draw do
  root to: 'pages#home'
  get 'search_lead', to: 'leads#search_lead'
  resources :leads, only: [:index, :show, :edit, :update, :new, :create]
end
