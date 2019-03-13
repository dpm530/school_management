class StudentsController < ApplicationController

   def index
      @student=Student.find(current_student.id)
      @student_course=Course.joins(:student_courses).where(student_courses:{ student_id: @student })
   end

   def create
      # @parent=Parent.exists?(params[:parent][:email])
      @student=Student.new(student_params)
      # @student.parent=@parent

      if @student.save
         flash[:notice]=["Registered Successfully!"]
         session[:student_id]=@student.id

         return redirect_to students_path
      end

      flash[:errors]=@student.errors.full_messages
      return redirect_to new_student_path

   end


   private

      def student_params
         params.require(:student).permit(:first_name, :last_name, :username, :password, :grade_level).merge(parent: @parent)
      end

end
