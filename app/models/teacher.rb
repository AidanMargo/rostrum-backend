class Teacher < ApplicationRecord
  has_secure_password

  # has_one_attached :avatar
  has_many :appointments
  has_many :todos
  has_many :teacher_students
  has_many :students, through: :teacher_students

  validates :email, presence: true, uniqueness: true
  # validates :first_name, :last_name, presence: true
  

  def total_students
    total = self.students.count
  end

  def total_appointments
    total = self.appointments.last.id
  end
  
end
