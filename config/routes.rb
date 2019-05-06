Rails.application.routes.draw do

   root 'application#index'
   get 'new' => 'application#new'



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
         post 'login/guest' => 'sessions#create_guest'
         post 'login/administrator' => 'sessions#create_administrator'
         post 'login/student' => 'sessions#create_student'
         post 'login/parent' => 'sessions#create_parent'
         post 'login/teacher' => 'sessions#create_teacher'
         delete 'logout' => 'sessions#destroy'
      end
   end

   resources :assignments do
      collection do
         post 'create/:id' => 'assignments#create'
         get 'new/:id' => 'assignments#new'
      end
   end

   resources :attendances do
      collection do
         get 'new/:id' => 'attendances#new'
      end
   end

   resources :gradebooks do
      collection do
         # get ':student_id/:course_id' => 'gradebooks#new'
         post ':student_id/:course_id' => 'gradebooks#create'
      end
   end

   resources :teachers do
      collection do
         get 'login' => 'teachers#login_teacher'
      end
   end

   resources :students
   resources :parents
   resources :students_contact_info
   resources :teachers_contact_info
   resources :courses





end
