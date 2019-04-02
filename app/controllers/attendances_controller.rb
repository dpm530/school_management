class AttendancesController < ApplicationController

   def index
   end

   def new
      @attendance=Attendance.all
   end

   def create
      @course=Course.find(params[:course_id])
      @students=params[:student_ids]
      puts "="*50
      puts @students
      puts "="*50
      @students.each do |student|
         Attendance.create(date: params[:date], student_id: student, course_id: params[:course_id])
      end
      return redirect_to new_attendance_path

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
      puts params[:student_ids]
      puts "="*50
   end



end
