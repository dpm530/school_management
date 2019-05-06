class GradebooksController < ApplicationController

   def create
      @course=Course.find(params[:course_id])
      @student=Student.find(params[:student_id])
      @gradebook=Gradebook.new(gradebook_params)

      if @gradebook.save
         flash[:notice]=["Grades added Successfully!"]
         return redirect_to "/gradebooks/"+(@course.id).to_s
      end

      flash[:errors]=@gradebook.errors.full_messages
      return redirect_to "/gradebooks/"+(@student.id).to_s+"/"+(@course.id).to_s

   end

   def show
      @course=Course.find(params[:id])
      @grades=Gradebook.where(course: @course).all
   end

   def new
      @student=Student.find(params[:student_id])
      @course=Course.find(params[:course_id])
   end

   private
      def gradebook_params
         params.require(:gradebook).permit(:letter_score, :number_score, :comment, :session, :year, :start_date, :end_date).merge(student: @student).merge(course: @course)
      end

end
