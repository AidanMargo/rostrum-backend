class Student < ApplicationRecord
  # has_secure_password

  # has_one_attached :avatar

  has_many :teacher_students
  has_many :teachers, through: :teacher_students


end

