class CreateTeachers < ActiveRecord::Migration[6.1]
  def change
    create_table :teachers do |t|
      t.string :name
      t.string :home_address
      t.string :specialisation
      t.integer :salary_receiving
      t.timestamps
    end
  end
end
