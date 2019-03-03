Rails.application.routes.draw do

   root 'application#index'

   resources :students

   post 'login' => 'sessions#create'
   delete 'logout' => 'sessions#destroy'



end
