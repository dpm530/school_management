class StudentCoursesController < ApplicationController

   def create

      @student=Student.find_by(username: params[:username])
      @course=Course.find(params[:id])

      if @student && @course
         flash[:notice]=["Successfully added Studetn to course"]
         StudentCourse.create(student: @student, course: @course)
         return redirect_to course_path
      end

      flash[:errors]=['Student not found.']
      return redirect_to course_path


   end

   def destroy
      @student_course=StudentCourse.find(params[:id])
      @course=@student_course.course
      @student_course.destroy
      return redirect_to course_path(@course)
   end




end
