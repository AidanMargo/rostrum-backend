class Student < ApplicationRecord
  # has_secure_password

  validates :first_name, :last_name, :age, :email, :phone_number, presence: true
  validates :email, email: true
  has_many :teacher_students
  has_many :teachers, through: :teacher_students


end

