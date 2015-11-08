class AddPersonToCourses < ActiveRecord::Migration
  def change
    add_reference :courses, :person, index: true
  end
end
