class ApplicationController < ActionController::Base

   def index
   end

   def new
   end

   def current_guest
      return Administrator.find(session[:guest_id]) if session[:guest_id]
   end

   def current_administrator
      return Administrator.find(session[:administrator_id]) if session[:administrator_id]
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

   helper_method :current_guest
   helper_method :current_administrator
   helper_method :current_student
   helper_method :current_teacher
   helper_method :current_parent

end
