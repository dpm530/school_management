class TeacherParentConversationsController < ApplicationController

   def index
      @teachers=Teacher.all
      @parents=Parent.all
      @mailbox_id=nil
      @inbox=nil

      if current_teacher
         @mailbox_id=current_teacher.id
      elsif current_parent
         @mailbox_id=current_parent.id
      end

      @teacher_conversations=TeacherParentConversation.where(teacher: @mailbox_id).all
      @parent_conversations=TeacherParentConversation.where(parent: @mailbox_id).all

      if current_teacher
         @inbox=@teacher_conversations
      elsif current_parent
         @inbox=@parent_conversations
      end

   end

   def teacher_create
      @teacher=Teacher.find(params[:teacher_id])
      @parent=Parent.find(params[:parent])
      @conversation=TeacherParentConversation.existsOrCreate(@teacher,@parent)
      return redirect_to teacher_parent_conversation_path(@conversation)
   end

   def parent_create
      @parent=Parent.find(params[:parent_id])
      @teacher=Teacher.find(params[:teacher])
      @conversation=TeacherParentConversation.existsOrCreate(@teacher,@parent)
      return redirect_to teacher_parent_conversation_path(@conversation)
   end

   def show
      @conversation=TeacherParentConversation.find(params[:id])
      @teacher=@conversation.teacher
      @parent=@conversation.parent
      @messages=@conversation.teacher_parent_messages


   end

end
