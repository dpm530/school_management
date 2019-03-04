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


   private

      def parent_params
         params.require(:parent).permit(:first_name, :last_name, :email, :password).merge(student: @student)
      end



end
