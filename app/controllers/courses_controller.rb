class CoursesController < ApplicationController

   def index
      @courses=Course.all
   end

   def create
      @course=Course.new(course_params)

      if @course.save
         flash[:notice]=["Successfully Added New Course"]
         session[:course_id]=@course.id
         return redirect_to courses_path
      end
      errors=@course.errors.full_messages
      flash[:errors]=errors
      return redirect_to new_course_path
   end

   def show
      @course=Course.find(params[:id])
      @student_course=Student.joins(:student_courses).where(student_courses:{ course_id: @course })
      @teacher_course=Teacher.joins(:teacher_courses).where(teacher_courses:{ course_id: @course })
   end

   def edit
      @course=Course.find(params[:id])
   end

   def destroy
      @course=Course.find(params[:id])
      @course.delete
      return redirect_to courses_path

   end

   private
      def course_params
         params.require(:course).permit(:name, :subject, :start_date, :end_date)
      end

end
