class StudentContactInfo < ApplicationRecord
  belongs_to :student

  validates :line_1_address, :line_2_address, :city, :state, :zipcode, presence: true



end
