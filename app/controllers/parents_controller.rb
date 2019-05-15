class ParentsController < ApplicationController
   before_action :require_parent_login, only: [:index]
   layout :determine_layout

   def index
      @parent=Parent.find(current_parent.id)
      @student=@parent.student

      if @student
         @courses=@student.courses
         @grades=Gradebook.where(student: @student).all
      end
      if @courses
         @assignments=Assignment.where(course: @courses).all
      end

      @date = params[:date] ? Date.parse(params[:date]) : Date.today
   end

   def courses
      @parent=Parent.find(current_parent.id)
      @student=@parent.student

      if @student
         @courses=@student.courses
         @grades=Gradebook.where(student: @student).all
      end
      if @courses
         @assignments=Assignment.where(course: @courses).all
      end


   end

   def assignments
      @parent=Parent.find(current_parent.id)
      @student=@parent.student

      if @student
         @courses=@student.courses
         @grades=Gradebook.where(student: @student).all
      end
      if @courses
         @assignments=Assignment.where(course: @courses).all
      end

      puts "="*100
      puts @parent.first_name
      puts @student.first_name
      puts "="*100
      
   end

   def gradebook
      @parent=Parent.find(current_parent.id)
      @student=@parent.student

      if @student
         @courses=@student.courses
         @grades=Gradebook.where(student: @student).all
      end
      if @courses
         @assignments=Assignment.where(course: @courses).all
      end
   end

   def login_parent
   end

   def show
      @parent=Parent.find(params[:id])
   end

   def create

      @parent=Parent.new(parent_params)

      if @parent.save
         flash[:notice]=["Registered Successfully"]
         return redirect_to administrators_path
      end

      errors=@parent.errors.full_messages
      flash[:errors]=errors
      return redirect_to new_parent_path

   end

   def edit
      @parent=Parent.find(params[:id])
   end

   def update
      @parent=Parent.find(params[:id])

      if @parent.update(parent_params)
         flash[:notice]=["Updated Parent"]
         return redirect_to parent_path(@parent)
      end

      errors=@parent.errors.full_messages
      flash[:errors]=errors
      return redirect_to edit_parent_path
   end

   def destroy
      @parent=Parent.find(params[:id])
      @parent.destroy
      return redirect_to '/administrators'
   end


   private

      def parent_params
         params.require(:parent).permit(:first_name, :last_name, :email, :password, :image).merge(student: @student)
      end

      def determine_layout
         if current_administrator
            "admin_dashboard"
         end

         if (current_teacher || current_parent || current_student)
            "users_dashboard"
         end
      end



end
