Rails.application.routes.draw do

   root 'application#index'

   resources :students
   resources :parents

   post 'login/student' => 'sessions#create_student'
   post 'login/parent' => 'sessions#create_parent'
   delete 'logout' => 'sessions#destroy'



end
