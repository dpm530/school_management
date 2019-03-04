class TeachersController < ApplicationController

   def index
      @teachers=Teacher.all
   end

   def create

      @teacher=Teacher.new(teacher_params)

      if @teacher.save
         flash[:notice]=["Registered Successfully"]
         session[:teacher_id]=@teacher.id
         return redirect_to teachers_path
      end

      errors=@teacher.errors.full_messages
      flash[:errors]=errors
      return redirect_to new_teacher_path

   end

   private
      def teacher_params
         params.require(:teacher).permit(:first_name, :last_name, :email, :password)
      end

end
