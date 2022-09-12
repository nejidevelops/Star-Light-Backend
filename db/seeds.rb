puts "🌱 Seeding..."

# Seed your database here
25.times do
    seeded_students = Student.create(
        student_name: Faker::Name.name,
        email: Faker::Internet.email,
        course_id: rand(1..8),
        teacher_id: rand(1..10)
    )
end

8.times do
    seeded_courses = Course.create(
        course_name: Faker::Commerce.department,
        fees: rand(12000..25000),
        department: Faker::Commerce.department,
        course_duration: rand(7..24)
    )
end

12.times do
    seeded_teachers = Teacher.create(
        name: Faker::Name.name,
        home_address: Faker::Address.street_address,
        specialisation: ['Software Engineering', 'Computer Science', 'Hospitality', 'Cosmetology', 'Finance','Cyber Security'].sample,
        salary_receiving: rand(20000..45000)
    )
end

puts "✅ Done seeding!"
