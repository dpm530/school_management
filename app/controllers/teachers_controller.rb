class TeachersController < ApplicationController

   def index
      @teacher=Teacher.find(current_teacher.id)
      @courses=@teacher.courses
      @assignments=Assignment.where(course: @courses).all
      @attendances=Attendance.where(course: @courses).all
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

   def show
      @teacher=Teacher.find(params[:id])
   end

   def edit
      @teacher=Teacher.find(params[:id])
   end

   def update
      @teacher=Teacher.find(params[:id])
      if @teacher.update(teacher_params)
         flash[:notice]=["Updated Teacher"]
         return redirect_to edit_teacher_path
      end

      errors=@teacher.errors.full_messages
      flash[:errors]=errors
      return redirect_to edit_teacher_path
   end

   def destroy
      @teacher=Teacher.find(params[:id])
      @teacher.destroy
      return redirect_to '/administrators#teachers'
   end

   private
      def teacher_params
         params.require(:teacher).permit(:first_name, :last_name, :email, :password)
      end

end
