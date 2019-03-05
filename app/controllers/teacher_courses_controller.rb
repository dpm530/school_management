class TeacherCoursesController < ApplicationController

   def create

      @teacher=Teacher.find_by(first_name: params[:teacher][:first_name], last_name: params[:teacher][:last_name])
      @course=Course.find(params[:id])

      # puts "="*50
      # puts @teacher.id
      # puts @course.id
      # puts "+"*50
      # puts @teacher
      # puts @course
      # puts "="*50

      if (@teacher) && (@course)
         flash[:notice]=["Successfully added teacher to course."]
         TeacherCourse.create(teacher: @teacher, course: @course)
         return redirect_to course_path
      end

      flash[:error]=["Teacher account doesn't exist."]
      return redirect_to course_path

   end


end
