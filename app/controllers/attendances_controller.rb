class AttendancesController < ApplicationController

   def index
   end

   def show
      @course=Course.find(params[:id])
      @student_course=Student.joins(:student_courses).where(student_courses:{ course_id: @course })

      @classroom=[]
      @attendance=Attendance.where(course: @course).all

      (@student_course.length).times do
         @classroom << Attendance.new
      end

      puts "="*50
      puts @classroom
      puts "="*50


   end

   def create
   end   




end
