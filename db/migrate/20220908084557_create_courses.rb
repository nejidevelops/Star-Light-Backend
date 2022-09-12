class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.string :course_name
      t.integer :fees
      t.string :department
      t.integer :course_duration
      t.timestamps
    end
  end
end
