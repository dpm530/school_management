class TeacherParentMessage < ApplicationRecord
  belongs_to :teacher_parent_conversation
  belongs_to :parent, optional: :true
  belongs_to :teacher, optional: :true 
end
