class Teacher < ApplicationRecord
   has_many :teacher_courses, dependent: :destroy
   has_many :courses, through: :teacher_courses, source: :course
   has_one :teacher_contact_info, dependent: :destroy
   has_many :teacher_parent_conversations

   has_secure_password

   mount_uploader :image, TeacherUploader

   validates :first_name, :last_name, presence: true, length: { minimum: 2 }
   validates :email, presence: true, uniqueness: true
   validates_format_of :email,with:  /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/


   before_save :downcase_fields


   def downcase_fields
      self.first_name.downcase!
      self.last_name.downcase!
      self.email.downcase!
   end

end
