class SessionsController < ApplicationController

   def create_student

      if (params[:username] === "") && (params[:password] === "")
         flash[:errors]=["Username and Password can't be blank."]
         return redirect_to new_student_path
      elsif (!(params[:password] === "") && (params[:username] === ""))
         flash[:errors]=["Username can't be blank."]
         return redirect_to new_student_path
      elsif (!(params[:username] === "") && (params[:password] === ""))
         flash[:errors]=["Password can't be blank."]
         return redirect_to new_student_path
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
         return redirect_to new_student_path
      end

   end

   def create_parent

      if (params[:email] === "") && (params[:password] === "")
         flash[:errors]=["Username and Password can't be blank."]
         return redirect_to new_parent_path
      elsif (!(params[:password] === "") && (params[:email] === ""))
         flash[:errors]=["Email can't be blank."]
         return redirect_to new_parent_path
      elsif (!(params[:email] === "") && (params[:password] === ""))
         flash[:errors]=["Password can't be blank."]
         return redirect_to new_parent_path
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
         return redirect_to new_parent_path
      end

   end

   def create_teacher
      if (params[:email] === "") && (params[:password] === "")
         flash[:errors]=["Username and Password can't be blank."]
         return redirect_to new_teacher_path
      elsif (!(params[:password] === "") && (params[:email] === ""))
         flash[:errors]=["Email can't be blank."]
         return redirect_to new_teacher_path
      elsif (!(params[:email] === "") && (params[:password] === ""))
         flash[:errors]=["Password can't be blank."]
         return redirect_to new_teacher_path
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
         return redirect_to new_teacher_path
      end
   end

   def destroy
      session.clear
      return redirect_to root_path
   end

end
