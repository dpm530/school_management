class StudentsController < ApplicationController
   before_action :require_student_login, only: [:index]
   layout :determine_layout

   def index
      @student=Student.find(current_student.id)
      @courses=@student.courses
      @assignments=Assignment.where(course: @courses).all
      @grades=Gradebook.where(student: @student).all
      @date = params[:date] ? Date.parse(params[:date]) : Date.today

   end

   def show
      @student=Student.find(params[:id])
      @contact=@student.student_contact_info
      @courses=@student.courses
   end

   def new
      @parents=Parent.all
   end

   def login_student

   end

   def create
      @parent=Parent.find(params[:parent][:id])
      @student=Student.new(student_params)
      @student.parent=@parent

      if @student.save
         flash[:notice]=["Registered Successfully!"]
         puts "="*100
         puts @parent.id
         puts "="*100

         return redirect_to administrators_path
      end

      flash[:errors]=@student.errors.full_messages
      return redirect_to new_student_path

   end

   def edit
      @student=Student.find(params[:id])
      @parents=Parent.all
   end

   def update
      # @parent=Parent.find(params[:parent][:id])
      @student=Student.find(params[:id])
      if @student.update(update_student_params)
         flash[:notice]=["Updated Student"]
         return redirect_to student_path(@student)
      end

      errors=@student.errors.full_messages
      flash[:errors]=errors
      return redirect_to edit_student_path
   end

   def destroy
      @student=Student.find(params[:id])
      @student.destroy
      return redirect_to '/administrators/#students'
   end


   private

      def student_params
         params.require(:student).permit(:first_name, :last_name, :username, :password, :grade_level).merge(parent: @parent)
      end

      def update_student_params
         params.require(:student).permit(:first_name, :last_name, :username, :password, :grade_level, :image).merge(parent: @parent)
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
