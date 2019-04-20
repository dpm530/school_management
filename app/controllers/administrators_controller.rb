class AdministratorsController < ApplicationController


   def index
      @teachers=Teacher.all
      @students=Student.all
      @courses=Course.all
   end

   def create
      @admin=Administrator.new(admin_params)

      if @admin.save
         flash[:notice]=["Registered Successfully!"]
         session[:administrator_id]=@admin.id

         return redirect_to administrators_path
      end

      flash[:errors]=@admin.errors.full_messages
      return redirect_to new_administrator_path
   end

   def teachers
      @teachers=Teacher.all
   end


   private
      def admin_params
         params.require(:administrator).permit(:login, :password)
      end

end
