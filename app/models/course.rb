class Course < ActiveRecord::Base
    has_many :students
    has_many :teachers, through: :students
end