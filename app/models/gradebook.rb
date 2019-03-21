class Gradebook < ApplicationRecord
  belongs_to :student
  belongs_to :course

  validates :letter_score, :number_score, :comment, :session, :year, :start_date, :end_date, presence: true 

end
