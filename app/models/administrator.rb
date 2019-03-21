class Administrator < ApplicationRecord
  has_secure_password

  validates :login, :password, presence: true

end
