class ParentsController < ApplicationController
   before_action :require_parent_login, only: [:index]
   layout "users_dashboard", only: [:index]

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



end
