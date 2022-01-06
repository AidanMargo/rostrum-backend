class Teacher < ApplicationRecord
  has_secure_password

  # has_one_attached :avatar
  has_many :appointments, dependent: :destroy
  has_many :todos, dependent: :destroy
  has_many :teacher_students, dependent: :destroy
  has_many :students, through: :teacher_students, dependent: :destroy

  validates :email, presence: true, uniqueness: true, email: true
  validates :first_name, :last_name, :password, :address, :phone_number, presence: true
  validates :password, length: {minimum: 6}

  

  def total_students
    total = self.students.count
  end

  def total_appointments
    total = self.appointments.count
  end
  
end
