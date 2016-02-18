class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.string :duration_in_min
      t.string :integer
      t.string :workout
      t.string :text
      t.string :workout_date
      t.string :date
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
