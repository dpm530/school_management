class AssignmentsController < ApplicationController
   layout :determine_layout

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

   def new
      @course=Course.find(params[:id])
   end

   def edit
      @assignment=Assignment.find(params[:id])
   end

   def update
      @assignment=Assignment.find(params[:id])
      if @assignment.update(update_assignment_params)
         flash[:notice]=["Updated Assignment"]
         return redirect_to edit_assignment_path
      end

      errors=@assignment.errors.full_messages
      flash[:errors]=errors
      return redirect_to edit_assignment_path
   end

   def destroy
      @assignment=Assignment.find(params[:id])
      @assignment.destroy
      return redirect_to assignment_path

   end

   private

      def assignment_params
         params.require(:assignment).permit(:name, :description, :due_date, :date_assigned).merge(course: @course)
      end

      def update_assignment_params
         params.require(:assignment).permit(:name, :description, :due_date, :date_assigned)
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
