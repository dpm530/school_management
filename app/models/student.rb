class Student < ApplicationRecord
   has_one :parent
   belongs_to :parent

   has_secure_password

   before_save :downcase_fields

   validates :first_name, :last_name, presence: true, length: { minimum: 2 }
   validates :username, presence: true, uniqueness: true

   def downcase_fields
      self.first_name.downcase!
      self.last_name.downcase!
      self.username.downcase!
   end

end
