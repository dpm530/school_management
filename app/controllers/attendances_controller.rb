class AttendancesController < ApplicationController

   def show
      @course=Course.find(params[:id])
      @student_course=Student.joins(:student_courses).where(student_courses:{ course_id: @course })
   end


end
