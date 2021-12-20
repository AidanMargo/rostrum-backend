# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:

require 'faker'

Teacher.destroy_all
Student.destroy_all
TeacherStudent.destroy_all


# def create_student 
  
#   student = Student.create(
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     email: Faker::Internet.email,
#     profile_pic: 'https://t4.ftcdn.net/jpg/00/64/67/63/360_F_64676383_LdbmhiNM6Ypzb3FM4PPuFP9rHe7ri8Ju.jpg',
#     password_digest: 'password',
#     password_confirmation: 'password',
#     )
#     TeacherStudent.create(teacher_id: 1, student_id: student.id)
# end




#  5.times do
#   teacher = Teacher.create(
#     first_name: 'Aidan',
#     last_name: 'Margo',
#     email: 'aidanmargo@gmail.com',
#     profile_pic: 'https://t4.ftcdn.net/jpg/00/64/67/63/360_F_64676383_LdbmhiNM6Ypzb3FM4PPuFP9rHe7ri8Ju.jpg',
#     password_digest: 'password',
#     password_confirmation: 'password',
#     )
  
#     teacher.avatar.attach(
#       io: File.open('./public/avatar/Mousse.JPG'),
#       filename: 'Mousse.jpg',
#       content_type: 'application/jpg'
#     )

    # create_student
#  end
