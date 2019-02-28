class Parent < ApplicationRecord
  belongs_to :student
  has_secure_password
end
