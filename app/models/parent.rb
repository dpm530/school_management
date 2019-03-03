class Parent < ApplicationRecord
   belongs_to :student
   has_many :students

   has_secure_password

   validates :first_name, :last_name, presence: true, length: { minimum: 2 }
   # validates_format_of :email,with:  /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/


   before_save :downcase_fields

   def downcase_fields
      self.first_name.downcase!
      self.last_name.downcase!
   end

   def self.exists?(email)
      parent=Parent.find_by(email: email)

      if parent
         return parent
      end
      return nil

   end

end
