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

   end

   def destroy
      session.clear
      return redirect_to root_path
   end

end
