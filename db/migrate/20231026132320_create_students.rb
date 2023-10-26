class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.string :scratch_username, null: false
      t.string :name, null: false

      t.timestamps
    end
  end
end
