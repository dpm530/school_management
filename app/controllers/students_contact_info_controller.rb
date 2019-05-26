class StudentsContactInfoController < ApplicationController
   layout :determine_layout

   def index
      @student_contact=current_student.student_contact_info
   end

   def new
      @student=current_student
   end

   def create
      @student=Student.find(params[:id])
      @student_contact=StudentContactInfo.new(student_contact_info_params)

      if @student_contact.save
         flash[:notice]=["Contact Info Created"]
         return redirect_to student_path(@student)
      end

      errors=@student_contact.errors.full_messages
      flash[:errors]=errors
      return redirect_to new_students_contact_info_path
   end

   def edit
      @students_contact=StudentContactInfo.find(params[:id])
   end

   def update
      @students_contact=StudentContactInfo.find(params[:id])
      @student=@students_contact.student
      if @students_contact.update(student_contact_info_params)
         flash[:notice]=["Updated Contact Info!"]
         return redirect_to student_path(@student)
      end

      errors=@students_contact.errors.full_messages
      flash[:errors]=errors
      return redirect_to edit_students_contact_info_path
   end

   def destroy
      @students_contact=StudentContactInfo.find(params[:id])
      @student=@students_contact.student
      @students_contact.destroy
      return redirect_to student_path(@student)
   end


   private

      def student_contact_info_params
         params.require(:student_contact_info).permit(:line_1_address, :line_2_address, :city, :state, :zipcode, :mobile_number).merge(student: @student)
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
