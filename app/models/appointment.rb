class Appointment < ApplicationRecord
  belongs_to :teacher

  validates :startDate, :teacher_id, presence: true
end
