class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.string :startDate
      t.string :endDate
      t.string :title
      t.text :notes
      t.integer :teacher_id
      t.boolean :allDay
      t.timestamps
    end
  end
end
