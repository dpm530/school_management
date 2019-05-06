class TeachersContactInfoController < ApplicationController

   def index
      @teacher_contact=current_teacher.teacher_contact_info
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

   def edit
      @teachers_contact_info=TeacherContactInfo.find(params[:id])
   end

   def update
      @teachers_contact_info=TeacherContactInfo.find(params[:id])
      if @teachers_contact_info.update(teacher_contact_info_params)
         flash[:notice]=["Updated Contact Info!"]
         return redirect_to teachers_contact_info_index_path
      end

      errors=@teachers_contact_info.errors.full_messages
      flash[:errors]=errors
      return redirect_to edit_teachers_contact_info_path
   end

   def destroy
      @teachers_contact_info=TeacherContactInfo.find(params[:id])
      @teachers_contact_info.destroy
      return redirect_to teachers_contact_info_index_path
   end

   private
      def teacher_contact_info_params
         params.require(:teacher_contact_info).permit(:line_1_address, :line_2_address, :city, :state, :zipcode, :mobile_number).merge(teacher: current_teacher)
      end


end
