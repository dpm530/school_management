class TeachersContactInfoController < ApplicationController
   layout :determine_layout

   def index
      @teacher_contact=current_teacher.teacher_contact_info
   end

   def new
      @teacher=current_teacher
   end

   def create
      @teacher=Teacher.find(params[:id])
      @teacher_contact=TeacherContactInfo.new(teacher_contact_info_params)

      if @teacher_contact.save
         flash[:notice]=["Contact Info Created"]
         return redirect_to teacher_path(@teacher)
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
      @teacher=@teachers_contact_info.teacher
      if @teachers_contact_info.update(teacher_contact_info_params)
         flash[:notice]=["Updated Contact Info!"]
         return redirect_to teacher_path(@teacher)
      end

      errors=@teachers_contact_info.errors.full_messages
      flash[:errors]=errors
      return redirect_to edit_teachers_contact_info_path
   end

   def destroy
      @teachers_contact_info=TeacherContactInfo.find(params[:id])
      @teacher=@teachers_contact_info.teacher
      @teachers_contact_info.destroy
      return redirect_to teacher_path(@teacher)
   end

   private

      def teacher_contact_info_params
         params.require(:teacher_contact_info).permit(:line_1_address, :line_2_address, :city, :state, :zipcode, :mobile_number).merge(teacher: @teacher)
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
