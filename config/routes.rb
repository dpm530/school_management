Rails.application.routes.draw do

   root 'application#index'
   get 'new' => 'application#new'

   resources :teacher_courses do
      collection do
         post ':id' => 'teacher_courses#create'
         delete ':id/delete' => 'teacher_courses#destroy'
      end
   end

   resources :student_courses do
      collection do
         post ':id' => 'student_courses#create'
         delete ':id/delete' => 'student_courses#destroy'
      end
   end

   resources :administrators do
      collection do
            get 'assignments' => 'administrators#assignments'
            get 'attendance' => 'administrators#attendance'
            get 'courses' => 'administrators#courses'
            get 'gradebook' => 'administrators#gradebook'
            get 'parents' => 'administrators#parents'
            get 'students' => 'administrators#students'
            get 'teachers' => 'administrators#teachers'
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
         get 'new/:student_id/:course_id' => 'gradebooks#new'
         post ':student_id/:course_id' => 'gradebooks#create'
      end
   end

   resources :teachers do
      collection do
         get 'login' => 'teachers#login_teacher'
      end
   end

   resources :students do
      collection do
         get 'login' => 'students#login_student'
      end
   end

   resources :teacher_parent_conversations do
      collection do
         post 'teacher/:teacher_id' => 'teacher_parent_conversations#teacher_create'
         post 'parent/:parent_id' => 'teacher_parent_conversations#parent_create'
      end
   end

   resources :teacher_parent_messages do
      collection do
         post 'teacher/:conversation_id' => 'teacher_parent_messages#teacher_create'
         post 'parent/:conversation_id' => 'teacher_parent_messages#parent_create'
      end
   end

   resources :parents do
      collection do
         get 'login' => 'parents#login_parent'
      end
   end

   resources :teachers_contact_info do
      collection do
         get 'new/:id' => 'teachers_contact_info#new'
         post ':id' => 'teachers_contact_info#create'
      end
   end

   resources :students_contact_info do
      collection do
         get 'new/:id' => 'students_contact_info#new'
         post ':id' => 'students_contact_info#create'
      end
   end

   resources :courses





end
