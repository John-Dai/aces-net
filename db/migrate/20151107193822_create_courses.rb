class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :subject
      t.string :course_number
      t.string :title

      t.timestamps
    end
  end
end
