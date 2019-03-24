class TeachersContactInfoController < ApplicationController

   def index
      @teacher_contact=TeacherContactInfo.all
   end

   def create
      @teacher_contact=TeacherContactInfo.new(teacher_contact_info_params)

      if @teacher_contact.save
         flash[:notice]=["Contact Info Created"]
         return redirect_to teachers_contact_info_index_path
      end

      errors=@teacher_contact.errors.full_messages
      flash[:errors]=errors

      return redirect_to new_teachers_contact_info_path
   end

   private
      def teacher_contact_info_params
         params.require(:teacher_contact_info).permit(:line_1_address, :line_2_address, :city, :state, :zipcode, :mobile_number).merge(teacher: current_teacher)
      end


end
