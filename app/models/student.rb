class Student < ApplicationRecord
   has_one :parent
   belongs_to :parent, optional: true
   has_one :student_contact_info

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
