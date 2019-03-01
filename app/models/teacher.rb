class Teacher < ApplicationRecord


   has_secure_password

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
