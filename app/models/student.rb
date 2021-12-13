class Student < ApplicationRecord
  has_secure_password

  has_one_attached :avatar
  has_many :teachers, through: :teacher_student


  def set_default_avatar
    user = User.
  end
end
