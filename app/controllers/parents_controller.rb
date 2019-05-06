class ParentsController < ApplicationController

   def index
      @parents=Parent.all
   end

   def create

      @parent=Parent.new(parent_params)

      if @parent.save
         flash[:notice]=["Registered Successfully"]
         session[:parent_id]=@parent.id
         return redirect_to parents_path
      end

      errors=@parent.errors.full_messages
      flash[:errors]=errors
      return redirect_to new_parent_path

   end

   def edit
      @parent=current_parent
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


   private

      def parent_params
         params.require(:parent).permit(:first_name, :last_name, :email, :password).merge(student: @student)
      end



end
