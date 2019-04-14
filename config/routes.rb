Rails.application.routes.draw do

   root 'application#index'



   post 'teacher-course/:id' => 'teacher_courses#create'
   post 'student-course/:id' => 'student_courses#create'

   resources :administrators do
      collection do
         get 'teachers'
         get 'students'
      end
   end

   resources :sessions do
      collection do
         post 'login/administrator' => 'sessions#create_administrator'
         post 'login/student' => 'sessions#create_student'
         post 'login/parent' => 'sessions#create_parent'
         post 'login/teacher' => 'sessions#create_teacher'
         delete 'logout' => 'sessions#destroy'
      end
   end

   resources :students
   resources :parents
   resources :teachers
   resources :students_contact_info
   resources :teachers_contact_info
   resources :courses
   resources :attendances

   resources :assignments
   post 'create/:id' => 'assignments#create'

   get ':student_id/:course_id' => 'gradebooks#show'
   post ':student_id/:course_id' => 'gradebooks#create'





end
