class AssignmentsController < ApplicationController

   def create
      @course=Course.find(params[:id])
      @assignment=Assignment.new(assignment_params)

      if @assignment.save
         flash[:notice]=["Assignment Created Successfully!"]
         return redirect_to assignment_path
      end

      errors=@assignment.errors.full_messages
      flash[:errors]=errors
      return redirect_to assignment_path
   end

   def show
      @course=Course.find(params[:id])
      @assignments=Assignment.where(course_id: @course).all
   end

   private
      def assignment_params
         params.require(:assignment).permit(:name, :description, :due_date, :date_assigned).merge(course: @course)
      end
end
