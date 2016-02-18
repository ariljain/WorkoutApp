class UpdateExercises < ActiveRecord::Migration
  def change
    remove_column :exercises, :duration_in_min, :string
    remove_column :exercises, :integer, :string
    remove_column :exercises, :workout, :string
    remove_column :exercises, :text, :string
    remove_column :exercises, :workout_date, :string
    remove_column :exercises, :date, :string

    add_column :exercises, :duration_in_min, :integer
    add_column :exercises, :workout, :text
    add_column :exercises, :workout_date, :date

  end
end