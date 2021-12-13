class Teacher < ApplicationRecord
  has_secure_password

  has_many :students, through: :teacher_student
end
