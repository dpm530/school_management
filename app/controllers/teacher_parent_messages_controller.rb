class TeacherParentMessagesController < ApplicationController

   def teacher_create
      @conversation=TeacherParentConversation.find(params[:conversation_id])
      @sender=current_teacher.id
      TeacherParentMessage.create(body: params[:body], teacher_parent_conversation: @conversation, sender: "teacher", teacher: current_teacher)
      return redirect_to teacher_parent_conversation_path(@conversation)
   end

   def parent_create
      @conversation=TeacherParentConversation.find(params[:conversation_id])
      @sender=current_parent.id
      TeacherParentMessage.create(body: params[:body], teacher_parent_conversation: @conversation, sender: "parent", parent: current_parent)
      return redirect_to teacher_parent_conversation_path(@conversation)
   end


end
