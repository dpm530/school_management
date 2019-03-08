class StudentCoursesController < ApplicationController

   def create
      @student=Student.find_by(first_name: params[:student][:first_name], last_name: params[:student][:last_name])
      @course=Course.find(params[:id])

      if (@student) && (@course)
         flash[:notice]=["Successfully added Studetn to course"]
         StudentCourse.create(student: @student, course: @course)
         return redirect_to course_path
      end

      flash[:error]=["Student account doesn't exist."]
      return redirect_to course_path


   end


end
