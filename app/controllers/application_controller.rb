class ApplicationController < ActionController::Base

   helper_method :current_guest
   helper_method :current_administrator
   helper_method :current_student
   helper_method :current_teacher
   helper_method :current_parent
   helper_method :current_user

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

   def current_user
      return Administrator.find(session[:guest_id]) if current_guest
      return Administrator.find(session[:administrator_id]) if current_administrator
      return Student.find(session[:student_id]) if current_student
      return Teacher.find(session[:teacher_id]) if current_teacher
      return Parent.find(session[:parent_id]) if current_parent
   end


   private
      def require_admin_login
         if !(session[:administrator_id] || session[:guest_id])
            return redirect_to root_path
         end
      end

      def require_teacher_login
         unless (session[:teacher_id])
            return redirect_to root_path
         end
      end

      def require_student_login
         unless (session[:student_id])
            return redirect_to root_path
         end
      end

      def require_parent_login
         unless (session[:parent_id])
            return redirect_to root_path
         end
      end


end
