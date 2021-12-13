class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.string :password_confirmation
      t.string :profile_pic
      t.string :address
      t.string :phone_number

      t.timestamps
    end
  end
end
