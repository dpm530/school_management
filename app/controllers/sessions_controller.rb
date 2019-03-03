class SessionsController < ApplicationController


   def destroy
      session.clear
      return redirect_to root_path
   end

end
