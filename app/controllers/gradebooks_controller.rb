class GradebooksController < ApplicationController
   layout :determine_layout

   def create
      @course=Course.find(params[:course_id])
      @student=Student.find(params[:student_id])
      @gradebook=Gradebook.new(gradebook_params)

      if @gradebook.save
         flash[:notice]=["Grades added Successfully!"]
         return redirect_to "/gradebooks/"+(@course.id).to_s
      end

      flash[:errors]=@gradebook.errors.full_messages
      return redirect_to "/gradebooks/"+(@student.id).to_s+"/"+(@course.id).to_s

   end

   def show
      @course=Course.find(params[:id])
      @students=@course.students
      @gradebooks=Gradebook.where(course: @course, student: @students)

      puts "="*100
      @gradebooks.each{|g| puts g }
      puts "="*100

   end

   def edit
      @gradebook=Gradebook.find(params[:id])
      @student=@gradebook.student
      @course=@gradebook.course
   end

   def update
      @gradebook=Gradebook.find(params[:id])
      if @gradebook.update(update_gradebook_params)
         flash[:notice]=["Updated Grade Record"]
         return redirect_to "/gradebooks/"+ (@gradebook.course.id).to_s
      end

      errors=@gradebook.errors.full_messages
      flash[:errors]=errors
      return redirect_to edit_gradebook_path
   end

   def new
      @student=Student.find(params[:student_id])
      @course=Course.find(params[:course_id])
   end

   def destroy
      @gradebook=Gradebook.find(params[:id])
      @gradebook.destroy
      return redirect_to "/gradebooks/"+(@gradebook.course.id).to_s
   end

   private

      def gradebook_params
         params.require(:gradebook).permit(:letter_score, :number_score, :comment, :session, :year, :start_date, :end_date).merge(student: @student).merge(course: @course)
      end

      def update_gradebook_params
         params.require(:gradebook).permit(:letter_score, :number_score, :comment, :session, :year, :start_date, :end_date)
      end

      def determine_layout
         if (current_administrator || current_guest)
            "admin_dashboard"
         elsif current_teacher
            "users_dashboard"
         elsif current_parent
            "users_dashboard"
         elsif current_student
            "users_dashboard"
         end
      end

end
