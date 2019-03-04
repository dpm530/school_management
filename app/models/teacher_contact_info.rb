class TeacherContactInfo < ApplicationRecord
  belongs_to :teacher

  validates :line_1_address, :line_2_address, :city, :state, :zipcode, presence: true

end
