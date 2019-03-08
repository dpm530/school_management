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
      @teacher_course=TeacherCourse.find_by(course: @course)
      @student_course=StudentCourse.find_by(course: @course)
      @teachers=Teacher.all
   end

   private
      def course_params
         params.require(:course).permit(:name, :subject, :start_date, :end_date)
      end

end
