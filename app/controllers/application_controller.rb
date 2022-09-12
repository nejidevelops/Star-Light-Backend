class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  #GET PORTION
  get '/' do
    puts "Welcome"
  end
  get '/students' do
    all_students = Student.all
    all_students.to_json(only: [:id, :student_name, :email, :course_id, :teacher_id])
  end

  get '/teachers' do
    all_teachers = Teacher.all
    all_teachers.to_json(only: [:id, :name,  :home_address, :specialisation, :salary_receiving])
  end

  get '/courses' do
    all_courses = Course.all
    all_courses.to_json(only: [:id, :course_name, :fees, :department, :course_duration])
  end

  get '/students/:id' do
    single_student = Student.find(params[:id])
    single_student.to_json(only: [:id, :name, :email], include: {
      course: { only: [:course_name]}
    })
  end

  get '/teachers/:id' do
    single_teacher = Teacher.find(params[:id])
    single_teacher.to_json(only: [:id, :name, :specialisation, :home_address, :salary_receiving],
      include: {students: {only: [:name], include: {course: {only: [:course_name]}}}}
    )
  end

  get '/courses/:id' do
    single_course = Course.find(params[:id])
    single_course.to_json(only: [:id, :course_name, :course_duration, :fees], include: {students: {only: [:name]}})
  end

  get '/courses/edit/:id' do
    single_course = Course.find(params[:id])
    single_course.to_json(only: [:id, :course_duration, :fees], include: {students: {only: [:name]}})
  end

  #POST PORTION
  post '/students' do
    send_it = Student.create(
      name: params[:name],
      email: params[:email],
      course_id: params[:course_id],
      teacher_id: params[:teacher_id]
    )
    send_it.to_json
  end

  post '/courses' do
    send_it = Course.create(
      course_name: params[:course_name],
      fees: params[:fees],
      department: params[:department],
      course_duration: params[:course_duration]
    )
    send_it.to_json
  end

  post '/teachers' do
    send_it = Teacher.create(
      name: params[:name],
      home_address: params[:home_address],
      specialisation: params[:specialisation],
      salary_receiving: params[:salary_receiving]
    )
    send_it.to_json
  end

  #PUT PORTION
  put '/students/:id' do
    fix_it = Student.find(params[:id])
    review.update(
      name: params[:name],
      email: params[:email],
      course_id: params[:course_id],
      teacher_id: params[:teacher_id]
    )
    fix_it.to_json
  end

  put '/courses/:id' do
    fix_it = Course.find(params[:id])
    fix_it.update(
      course_name: params[:course_name],
      fees: params[:fees],
      department: params[:department],
      course_duration: params[:course_duration]
    )
  end

  put '/teachers/:id' do
    fix_it = Teacher.find(params[:id])
    fix_it.update(
      name: params[:name],
      home_address: params[:home_address],
      specialisation: params[:specialisation],
      salary_receiving: params[:salary_receiving]
    )
    fix_it.to_json
  end

  #PATCH PORTION
  patch '/students/:id' do
    fix_it = Student.find(params[:id])
    review.update(
      name: params[:name],
      email: params[:email]
    )
    fix_it.to_json
  end

  patch '/courses/:id' do
    fix_it = Course.find(params[:id])
    fix_it.update(
      course_name: params[:course_name],
      fees: params[:fees],
      course_duration: params[:course_duration]
    )
  end

  patch '/teachers/:id' do
    fix_it = Teacher.find(params[:id])
    fix_it.update(
      name: params[:name],
      home_address: params[:home_address],
      specialisation: params[:specialisation],
      salary_receiving: params[:salary_receiving]
    )
    fix_it.to_json
  end

  #DELETE PORTION
  delete '/students/:id' do
    yeeted = Student.find(params[:id])
    yeeted.destroy
    yeeted.to_json
  end

  delete '/teachers/:id' do
    yeeted = Teacher.find(params[:id])
    yeeted.destroy
    yeeted.to_json
  end

  delete '/courses/:id' do
    yeeted = Course.find(params[:id])
    yeeted.destroy
    yeeted.to_json
  end
  
end