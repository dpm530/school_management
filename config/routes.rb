Rails.application.routes.draw do

   root 'application#index'

   resources :students
   resources :parents

   post 'student/login' => 'sessions#create_student'
   delete 'logout' => 'sessions#destroy'



end
