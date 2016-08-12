class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.string :category
      t.string :question
      t.string :answer
      t.integer :points
      t.timestamps
    end
  end
end
