class ApplicationController < ActionController::Base

   def index
   end

   def current_student
      return Student.find(session[:student_id]) if session[:student_id]
   end

   def current_teacher
      return Teacher.find(session[:teacher_id]) if session[:teacher_id]
   end

   def current_parent
      return Parent.find(session[:parent_id]) if session[:parent_id]
   end

   helper_method :current_student
   helper_method :current_teacher
   helper_method :current_parent

end
