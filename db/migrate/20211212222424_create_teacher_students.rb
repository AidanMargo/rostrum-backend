class CreateTeacherStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :teacher_students do |t|
      t.integer :teacher_id
      t.integer :student_id

      t.timestamps
    end
  end
end
