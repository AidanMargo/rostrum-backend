class AppointmentSerializer < ActiveModel::Serializer
  attributes :id, :startDate, :endDate, :title, :teacher_id

  has_one :teacher
end
