# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
first_department = Department.create( name: 'Support' )
second_department = Department.create( name: 'R&D' )
Worker.create(name: 'John', surname: 'Doe', salary: 500, way_of_payment: :per_hour, address: 'Masherova ave., 11', department: first_department )
Worker.create( name: 'Marco', surname: 'Giampaolo', salary: 700, way_of_payment: :full_time, address: 'Lenina str., 11', department: second_department )
