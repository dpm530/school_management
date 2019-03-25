class StudentsContactInfoController < ApplicationController

   def index
      @student_contact=StudentContactInfo.all
   end

   def create
      @student_contact=StudentContactInfo.new(student_contact_info_params)

      if @student_contact.save
         flash[:notice]=["Contact Info Created"]
         return redirect_to students_contact_info_index_path
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
      if @students_contact.update(student_contact_info_params)
         flash[:notice]=["Updated Contact Info!"]
         return redirect_to students_contact_info_index_path
      end

      errors=@students_contact.errors.full_messages
      flash[:errors]=errors
      return redirect_to edit_students_contact_info_path
   end

   def destroy
      @students_contact=StudentContactInfo.find(params[:id])
      @students_contact.destroy
      return redirect_to students_contact_info_index_path
   end


   private
      def student_contact_info_params
         params.require(:student_contact_info).permit(:line_1_address, :line_2_address, :city, :state, :zipcode, :mobile_number).merge(student: current_student)
      end


end
