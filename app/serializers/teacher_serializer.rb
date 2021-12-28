class TeacherSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :address, :phone_number

  has_many :todos
  has_many :students
  has_many :appointments
end
