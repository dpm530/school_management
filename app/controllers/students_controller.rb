class StudentsController < ApplicationController

   def index
      @student=Student.find(current_student.id)
      @courses=@student.courses
      @assignments=Assignment.where(course: @courses).all
      @date = params[:date] ? Date.parse(params[:date]) : Date.today
   end

   def show
      @student=Student.find(params[:id])
      @contact=@student.student_contact_info
      @courses=@student.courses
   end

   def login_student
   
   end

   def create
      # @parent=Parent.exists?(params[:parent][:email])
      @student=Student.new(student_params)
      # @student.parent=@parent

      if @student.save
         flash[:notice]=["Registered Successfully!"]

         return redirect_to administrators_path
      end

      flash[:errors]=@student.errors.full_messages
      return redirect_to new_student_path

   end

   def edit
      @student=Student.find(params[:id])
   end

   def update
      @student=Student.find(params[:id])
      if @student.update(student_params)
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

end
