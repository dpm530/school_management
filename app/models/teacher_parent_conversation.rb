class TeacherParentConversation < ApplicationRecord
  belongs_to :parent
  belongs_to :teacher
  has_many :teacher_parent_messages, dependent: :destroy


  def self.existsOrCreate(teacher, parent)
     conversation=TeacherParentConversation.find_by(teacher: teacher, parent: parent)
     if conversation
        return conversation
     end
     return TeacherParentConversation.create(teacher: teacher, parent: parent)
  end

end
