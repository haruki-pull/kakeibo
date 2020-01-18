Rails.application.routes.draw do
  
  root 'static_pages#home'
  get  '/fork' ,to: 'static_pages#fork'
  resources :expenses
  resources :incomes
end
