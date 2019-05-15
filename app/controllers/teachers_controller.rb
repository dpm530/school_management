class TeachersController < ApplicationController
   before_action :require_teacher_login, only: [:index]
   layout :determine_layout

   def index
      @teacher=Teacher.find(current_teacher.id)
      @courses=@teacher.courses
      @assignments=Assignment.where(course: @courses).all
      @attendances=Attendance.where(course: @courses).all
      @date = params[:date] ? Date.parse(params[:date]) : Date.today
   end

   def new
   end

   def assignmetns
      @teacher=Teacher.find(current_teacher.id)
      @courses=@teacher.courses
      @assignments=Assignment.where(course: @courses).all
   end

   def courses
      @teacher=Teacher.find(current_teacher.id)
      @courses=@teacher.courses
   end

   def gradebook
      @teacher=Teacher.find(current_teacher.id)
      @courses=@teacher.courses
   end

   def create

      @teacher=Teacher.new(teacher_params)

      if @teacher.save
         flash[:notice]=["Registered Successfully"]
         return redirect_to administrators_path
      end

      errors=@teacher.errors.full_messages
      flash[:errors]=errors
      return redirect_to new_teacher_path

   end

   def show
      @teacher=Teacher.find(params[:id])
      @contact=@teacher.teacher_contact_info
      @courses=@teacher.courses
   end

   def edit
      @teacher=Teacher.find(params[:id])
   end

   def update
      @teacher=Teacher.find(params[:id])
      if @teacher.update(teacher_params)
         flash[:notice]=["Updated Teacher"]
         return redirect_to teacher_path(@teacher)
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
         params.require(:teacher).permit(:first_name, :last_name, :email, :password, :image)
      end

      def determine_layout
         if current_administrator
            "admin_dashboard"
         end

         if (current_teacher || current_parent || current_student)
            "users_dashboard"
         end
      end



end
