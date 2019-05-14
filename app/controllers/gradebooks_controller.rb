class GradebooksController < ApplicationController
   layout "admin_dashboard", only: [:new, :show, :edit]

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
      @gradebooks=Gradebook.all
      # @a=Student.find(3)

      # puts "="*100
      # @students.each do |student|
      #    puts student.first_name
      #    if (student.gradebooks.exists?)
      #       puts "Yes it does"
      #    else
      #       puts "No it doesnt"
      #    end
      # end
      # puts "="*100
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

end
