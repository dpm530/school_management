Rails.application.routes.draw do

   root 'application#index'

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
   post 'student/:id/course/:id' => 'gradebooks#create'

   post 'teacher-course/:id' => 'teacher_courses#create'
   post 'student-course/:id' => 'student_courses#create'

   post 'login/student' => 'sessions#create_student'
   post 'login/parent' => 'sessions#create_parent'
   post 'login/teacher' => 'sessions#create_teacher'
   delete 'logout' => 'sessions#destroy'



end
