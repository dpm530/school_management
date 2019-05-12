class Student < ApplicationRecord
   belongs_to :parent, optional: true
   has_one :student_contact_info, dependent: :destroy
   has_many :student_courses, dependent: :destroy
   has_many :courses, through: :student_courses, source: :course
   has_many :attendances, dependent: :destroy
   has_many :gradebooks, dependent: :destroy

   has_secure_password

   validates :first_name, :last_name, presence: true, length: { minimum: 2 }
   validates :username, presence: true


   before_save :downcase_fields


   def downcase_fields
      self.first_name.downcase!
      self.last_name.downcase!
      self.username.downcase!
   end

end
