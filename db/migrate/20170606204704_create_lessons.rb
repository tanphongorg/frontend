class CreateLessons < ActiveRecord::Migration[5.1]
  def change
    create_table :lessons do |t|
      t.references :course, foreign_key: true
      t.string :title, null: false, limit: 255
      t.text :description, null: false, limit: 1000

      t.timestamps
    end
  end
end
