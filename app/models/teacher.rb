class Teacher < ApplicationRecord
  has_secure_password

  # has_one_attached :avatar
  has_many :teacher_students
  has_many :students, through: :teacher_students

  validates :email, presence: true, uniqueness: true
  # validates :first_name, :last_name, presence: true
  
end
