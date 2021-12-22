class TodoSerializer < ActiveModel::Serializer
  attributes :id, :content

  has_one :teacher
end
