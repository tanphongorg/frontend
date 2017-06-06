class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.references :user, foreign_key: true
      t.string :title, null: false, limit: 255
      t.string :description, null: false, limit: 1000
      t.integer :price, null: false, default: 0

      t.timestamps
    end
  end
end
