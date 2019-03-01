class Parent < ApplicationRecord
   belongs_to :student
   has_many :students

   has_secure_password

   before_save :downcase_fields

   validates :first_name, :last_name, presence: true, length: { minimum: 2 }
   validates :email, presence: true, uniqueness: true
   validates_format_of :email,with:  /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

   def downcase_fields
      self.first_name.downcase!
      self.last_name.downcase!
      self.email.downcase!
   end

end
