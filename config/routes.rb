Rails.application.routes.draw do

   root 'application#index'

   resources :students
   resources :parents
   resources :teachers
   resources :students_contact_info
   resources :teachers_contact_info
   resources :courses 

   post 'login/student' => 'sessions#create_student'
   post 'login/parent' => 'sessions#create_parent'
   post 'login/teacher' => 'sessions#create_teacher'
   delete 'logout' => 'sessions#destroy'



end
