class SessionsController < ApplicationController


   def create_guest
      @guest=Administrator.find_by_login(params[:login])

      if @guest
         if @guest.try(:authenticate, params[:password])
            session[:guest_id]=@guest.id
            return redirect_to administrators_path
         end
         flash[:errors]=["Password is invalid."]
      end
      flash[:errors]=["Username entered is invalid."]
      return redirect_to new_administrator_path
   end

   def create_administrator
      @admin=Administrator.find_by_login(params[:login])

      if @admin
         if @admin.try(:authenticate, params[:password])
            session[:administrator_id]=@admin.id
            return redirect_to administrators_path
         end
         flash[:errors]=["Password is invalid."]
      end
      flash[:errors]=["Login entered is invalid."]
      return redirect_to new_administrator_path
   end

   def create_student

      if (params[:username] === "") && (params[:password] === "")
         flash[:errors]=["Username and Password can't be blank."]
         return redirect_to login_students_path
      elsif (!(params[:password] === "") && (params[:username] === ""))
         flash[:errors]=["Username can't be blank."]
         return redirect_to login_students_path
      elsif (!(params[:username] === "") && (params[:password] === ""))
         flash[:errors]=["Password can't be blank."]
         return redirect_to login_students_path
      else
         @student=Student.find_by_username(params[:username])

         if @student
            if @student.try(:authenticate, params[:password])
               session[:student_id]=@student.id
               return redirect_to students_path
            end
            flash[:errors]=["Password is invalid."]
         end
         flash[:errors]=["Username Account is Invalid."]
         return redirect_to login_students_path
      end

   end

   def create_parent

      if (params[:email] === "") && (params[:password] === "")
         flash[:errors]=["Username and Password can't be blank."]
         return redirect_to login_parents_path
      elsif (!(params[:password] === "") && (params[:email] === ""))
         flash[:errors]=["Email can't be blank."]
         return redirect_to login_parents_path
      elsif (!(params[:email] === "") && (params[:password] === ""))
         flash[:errors]=["Password can't be blank."]
         return redirect_to login_parents_path
      else
         @parent=Parent.find_by_email(params[:email])

         if @parent
            if @parent.try(:authenticate, params[:password])
               session[:parent_id]=@parent.id
               return redirect_to parents_path
            end
            flash[:errors]=["Password is invalid."]
         end
         flash[:errors]=["Email Account is Invalid."]
         return redirect_to login_parents_path
      end

   end

   def create_teacher
      if (params[:email] === "") && (params[:password] === "")
         flash[:errors]=["Username and Password can't be blank."]
         return redirect_to login_teachers_path
      elsif (!(params[:password] === "") && (params[:email] === ""))
         flash[:errors]=["Email can't be blank."]
         return redirect_to login_teachers_path
      elsif (!(params[:email] === "") && (params[:password] === ""))
         flash[:errors]=["Password can't be blank."]
         return redirect_to login_teachers_path
      else
         @teacher=Teacher.find_by_email(params[:email])

         if @teacher
            if @teacher.try(:authenticate, params[:password])
               session[:teacher_id]=@teacher.id
               return redirect_to teachers_path
            end
            flash[:errors]=["Password is invalid."]
         end
         flash[:errors]=["Email Account is Invalid."]
         return redirect_to login_teachers_path
      end
   end

   def destroy
      session.clear
      return redirect_to root_path
   end

end
