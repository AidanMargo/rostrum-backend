class Student < ApplicationRecord
  has_secure_password

  has_many :teachers, through: :teacher_student
end
