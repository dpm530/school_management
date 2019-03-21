class GradebooksController < ApplicationController

   def create
      @course=Course.find_by(params[:id])
      @student=Student.find_by(params[:id])
      @gradebook=Gradebook.new(gradebook_params)

      puts "="*50
      puts @course.name
      puts "="*50
      puts @student.first_name
      puts "="*50

      if @gradebook.save
         flash[:notice]=["Grades added Successfully!"]
         return redirect_to "/student/"+(@student.id).to_s+"/course/"+(@course.id).to_s
      end

      flash[:errors]=@gradebook.errors.full_messages
      return redirect_to "/student/"+(@student.id).to_s+"/course/"+(@course.id).to_s

   end

   def show
      @course=Course.find(params[:course_id])
      @student=Student.find(params[:student_id])
      @grades=Gradebook.where(student: @student).all

      puts "="*50
      # puts @course.name
      puts "="*50
      puts @student.first_name
      puts "="*50

   end

   private
      def gradebook_params
         params.require(:gradebook).permit(:letter_score, :number_score, :comment, :session, :year, :start_date, :end_date).merge(student: @student).merge(course: @course)
      end

end
