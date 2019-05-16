class AdministratorsController < ApplicationController
   before_action :require_admin_login, only: [:index]
   layout :determine_layout


   def index
      @teachers=Teacher.all
      @students=Student.all
      @courses=Course.all
      @parents=Parent.all
      @gradebooks=Gradebook.all
      @date = params[:date] ? Date.parse(params[:date]) : Date.today
   end

   def teachers
      @teachers=Teacher.all
   end

   def students
      @students=Student.all
   end

   def parents
      @parents=Parent.all
   end

   def courses
      @courses=Course.all
   end

   def gradebook
      @courses=Course.all
      @gradebooks=Gradebook.all
   end

   def assignments
      @courses=Course.all
   end

   def show
   end

   def new
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

   def edit
      @admin=Administrator.find(params[:id])
   end

   def update
      @admin=Administrator.find(params[:id])
      if @admin.update(admin_params)
         flash[:notice]=["Updated admin"]
         return redirect_to administrator_path(@admin)
      end

      errors=@admin.errors.full_messages
      flash[:errors]=errors
      return redirect_to edit_administrator_path
   end


   private

      def admin_params
         params.require(:administrator).permit(:login, :password)
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
