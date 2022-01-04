class Todo < ApplicationRecord

  belongs_to :teacher

  validates :content, :teacher_id, presence: true
end
