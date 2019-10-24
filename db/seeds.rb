# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Création de 100 Doctors
require 'faker'
100.times do
  doctor = Doctor.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, specialty: Faker::Job.position, zip_code:Faker::Address.zip_code)
end

# Création de 100 Patients
require 'faker'
100.times do
  patient = Patient.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
end

# Création de 100 Appointments (avec random Doctor & random Patient)
require 'faker'
100.times do
  appointment = Appointment.create!(doctor: Doctor.all.sample.id, patient: Patient.all.sample.id, date: Faker::Date.in_date_period)
end

# Création de 100 City
require 'faker'
100.times do
  city = City.create!(city_name: Faker::Address.city)
end

# Relier les City aux Doctor
Doctor.all.each do |doctor|
  doctor.update(city_id: City.all.sample.id)
end

# Relier les City aux Patient
Patient.all.each do |patient|
  patient.update(city_id: City.all.sample.id)
end

# Relier les City aux Appointment
Appointment.all.each do |appointment|
  appointment.update(city_id: City.all.sample.id)
end

# Création de 100 Specialty
require 'faker'
100.times do
  specialty = Specialty.create!(specialty: Faker::Job.seniority)
end

# Création de 100 JoinTableDoctorSpecialty (avec random Doctor & random Specialty)
require 'faker'
100.times do
  join_table_doctor_specialty = JoinTableDoctorSpecialty.create!(doctor_id: Doctor.all.sample.id, specialty_id: Specialty.all.sample.id)
end


