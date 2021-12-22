class CreateTodos < ActiveRecord::Migration[6.1]
  def change
    create_table :todos do |t|
      t.integer :teacher_id
      t.string :content

      t.timestamps
    end
  end
end
