class TeacherCoursesController < ApplicationController

   def create

      @teacher=Teacher.find_by(email: params[:email])
      @course=Course.find(params[:id])

      puts "="*100
      puts @teacher
      puts "="*100
      puts @course
      puts "="*100

      if @teacher && @course
         TeacherCourse.create(teacher: @teacher, course: @course)
         flash[:notice]=["Successfully added teacher to course."]
         return redirect_to course_path
      end

      flash[:error]=["Teacher account doesn't exist."]
      return redirect_to course_path

   end


end
