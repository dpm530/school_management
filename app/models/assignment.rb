class Assignment < ApplicationRecord
   belongs_to :course

   validates :name, :description, :date_assigned, :due_date, presence: true 

end
